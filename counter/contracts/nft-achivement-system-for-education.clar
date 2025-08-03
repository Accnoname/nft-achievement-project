(define-trait sip009-nft-trait
  (
    ;; Standard NFT functions
    (get-token-uri (uint) (response (optional (string-utf8 256)) (string-utf8 128)))
    (get-owner (uint) (response (optional principal) (string-utf8 128)))
    (transfer (uint principal principal) (response bool (string-utf8 128)))
  )
)

;; === Data Structures ===
(define-map courses uint { name: (string-utf8 64), active: bool })
(define-map achievements { student: principal, course-id: uint } { token-id: uint })
(define-map tokens uint { owner: principal, uri: (string-utf8 256) })
(define-data-var next-course-id uint u1)
(define-data-var next-token-id uint u1)

;; === Read-only ===
(define-read-only (get-course (id uint))
  (map-get courses id)
)

(define-read-only (get-user-achievement (user principal) (course-id uint))
  (map-get achievements { student: user, course-id: course-id })
)

(define-read-only (get-token-uri (id uint))
  (match (map-get tokens id)
    token-data (ok (some (get uri token-data)))
    (err "Token not found")
  )
)

(define-read-only (get-owner (id uint))
  (match (map-get tokens id)
    token-data (ok (some (get owner token-data)))
    (err "Token not found")
  )
)

;; === Public Functions ===

(define-public (create-course (name (string-utf8 64)))
  (let (
    (id (var-get next-course-id))
  )
    (begin
      (map-set courses id { name: name, active: true })
      (var-set next-course-id (+ id u1))
      (ok id)
    )
  )
)

(define-public (deactivate-course (id uint))
  (match (map-get courses id)
    course-data
      (begin
        (map-set courses id { name: (get name course-data), active: false })
        (ok true)
      )
    (err "Course not found")
  )
)

(define-public (mint-nft (course-id uint) (student principal) (uri (string-utf8 256)))
  (match (map-get courses course-id)
    course-data
      (if (not (get active course-data))
          (err "Course is not active")
          (let ((existing (map-get achievements { student: student, course-id: course-id })))
            (if (is-some existing)
                (err "Achievement already exists")
                (let ((token-id (var-get next-token-id)))
                  (begin
                    (map-set tokens token-id { owner: student, uri: uri })
                    (map-set achievements { student: student, course-id: course-id } { token-id: token-id })
                    (var-set next-token-id (+ token-id u1))
                    (ok token-id)
                  )
                )
            )
          )
    )
    (err "Course not found")
  )
)

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
  (match (map-get tokens token-id)
    token-data
      (if (is-eq (get owner token-data) sender)
          (begin
            (map-set tokens token-id { owner: recipient, uri: (get uri token-data) })
            (ok true)
          )
          (err "Sender is not owner")
      )
    (err "Token not found")
  )
)
(define-public (get-token-uri (id uint))
  (match (map-get tokens id)
    token-data (ok (get uri token-data))
    (err "Token not found")
  )
)
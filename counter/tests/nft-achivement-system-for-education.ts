(use-trait sip009-trait .nft-achievement)

(define-public (run-tests)
  (begin
    ;; Test 1: Create a course
    (asserts! (is-eq (contract-call? .nft-achievement create-course u"Stacks Bootcamp") (ok u1)) (err u100))

    ;; Test 2: Mint NFT for a student
    (asserts! (is-eq (contract-call? .nft-achievement mint-nft u1 'ST2J4F2Z89R2X9E7V3V0HJ0EG2X2F9F6N8J1R5Y39 u"ipfs://hash1") (ok u1)) (err u101))

    ;; Test 3: Get token URI
    (asserts! (is-eq (contract-call? .nft-achievement get-token-uri u1) (ok (some u"ipfs://hash1"))) (err u102))

    ;; Test 4: Transfer NFT to another user
    (asserts! (is-eq (contract-call? .nft-achievement transfer u1 'ST2J4F2Z89R2X9E7V3V0HJ0EG2X2F9F6N8J1R5Y39 'ST2C2V3F3E3G5H5I5J5K5L5M5N5O5P5Q5R5S5T5U) (ok true)) (err u103))

    ;; Test 5: Get new owner after transfer
    (asserts! (is-eq (contract-call? .nft-achievement get-owner u1) (ok (some 'ST2C2V3F3E3G5H5I5J5K5L5M5N5O5P5Q5R5S5T5U))) (err u104))

    ;; Test 6: Prevent duplicate minting for same course & user
    (asserts! (is-eq (contract-call? .nft-achievement mint-nft u1 'ST2J4F2Z89R2X9E7V3V0HJ0EG2X2F9F6N8J1R5Y39 u"ipfs://hash2") (err "Achievement already exists")) (err u105))

    ;; All tests passed
    (ok true)
  )
)

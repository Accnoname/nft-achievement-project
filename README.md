# 🎓 NFT Achievement System for Education

An open-source **NFT Achievement Badge system** built on the **Stacks blockchain**, allowing educators to issue verifiable course completion NFTs to students. This project leverages **Clarity smart contracts** with **IPFS integration** for decentralized metadata storage.

---

## ✨ Features

* 🏫 Instructors can **create & manage courses**.
* 🎖️ Students receive **NFT badges** upon course completion.
* 🔁 NFTs are **transferable** between Stacks wallets.
* 📦 Metadata (course info, badge image) stored securely on **IPFS**.
* 🔎 Public **read-only functions** to verify achievements & ownership.

  
<img width="3832" height="2185" alt="Screenshot 2025-08-04 130856" src="https://github.com/user-attachments/assets/95c06332-c925-4265-a812-f4d9a90f0e16" />
<img width="3791" height="2147" alt="image" src="https://github.com/user-attachments/assets/c0b126af-f833-4647-903d-1baa40707534" />
<img width="3478" height="2244" alt="Screenshot 2025-08-01 213730" src="https://github.com/user-attachments/assets/9061bb5a-fd72-443d-939f-9785beb4e213" />





---

## 🚀 Deployment Guide

### Prerequisites:

1. **Clarinet** — Smart contract development toolkit: [Install Here](https://docs.stacks.co/clarinet/installation)
2. **Hiro Wallet** — Stacks wallet for deployment: [Download Here](https://www.hiro.so/wallet)
3. **STX Testnet Tokens** — Get from [Stacks Faucet](https://explorer.stacks.co/sandbox/faucet?chain=testnet)

### Steps:

```bash
# Initialize Project
clarinet new nft-achievement-project
cd nft-achievement-project

# Add smart contract code to 'contracts/nft-achievement.clar'

# Verify Syntax & Run Local Tests
clarinet check
clarinet integrate
```

4. Deploy to **Stacks Sandbox**: [Sandbox Portal](https://explorer.stacks.co/sandbox)
5. Interact with contract methods:

   * `create-course`
   * `mint-nft`
   * `transfer-nft`

---

## 👨‍💻 Team

* **Nguyễn Trung Hiếu** — Smart Contract Developer
* **CYBR Team** — Project Collaboration

---

## 📚 Resources

* [Clarity Language Documentation](https://docs.stacks.co/clarity/language-reference)
* [Stacks Blockchain Documentation](https://docs.stacks.co)
* [IPFS Official Docs](https://docs.ipfs.io)

---

## 📝 License

This project is licensed under the **MIT License**.

---

> **STACKS x RISE IN Hackathon Project** — Empowering decentralized education (DeEd) with transparent and verifiable credentials.




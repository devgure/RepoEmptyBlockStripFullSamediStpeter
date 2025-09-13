blockchain/
├── contracts/
│   ├── IdentityVerifier.sol    # Stores facial hash + user ID on-chain
│   └── ProfileBadgeNFT.sol     # Mint NFTs for “Verified”, “Top Swiper”, etc.
├── sdk/
│   └── web3.ts                 # Connect wallet, sign message, mint NFT
└── scripts/
    └── deploy-contracts.js     # Deploy to Polygon/Mumbai for cheap MVP
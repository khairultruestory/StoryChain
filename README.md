<h1>StoryChain Marketplace</h1>

StoryChain is an innovative blockchain-powered marketplace that revolutionizes the way authors publish, own, and monetize their literary works while providing readers with a transparent and engaging platform to discover and support their favorite writers. At its core, StoryChain leverages blockchain technology to create a decentralized ecosystem that addresses key challenges in the traditional publishing industry. Each story or book published on the platform is minted as a unique non-fungible token (NFT), establishing clear and indisputable ownership rights for the author. This blockchain-based ownership model ensures that creators retain full control over their intellectual property while providing an immutable record of publication dates and authorship. The platform's user-friendly interface allows authors to easily upload their works, input metadata, and mint their stories as NFTs. To publish, authors pay a gas fee, which not only covers the blockchain transaction costs but also serves as proof of ownership. StoryChain provides clear explanations of these fees and the associated benefits, ensuring authors understand the value of blockchain-based ownership. For readers, StoryChain offers a rich library of diverse content across various genres. The platform's intuitive discovery features, including advanced search functionality and genre-based browsing, make it easy for readers to find new and exciting stories. A seamless reading interface enhances the user experience, allowing readers to immerse themselves in their chosen works. One of StoryChain's standout features is its direct donation mechanism. Readers can support authors they appreciate by making cryptocurrency or traditional currency donations directly through the platform. This system bypasses traditional intermediaries, ensuring that a higher percentage of the contribution reaches the author. The platform provides transparency by displaying donation amounts received by each author, fostering a sense of community and direct support between readers and writers. StoryChain takes a proactive approach to protecting intellectual property rights. The platform incorporates a sophisticated plagiarism prevention system that utilizes blockchain timestamps and content hashing. Each new submission is cross-referenced against existing blockchain records, making it virtually impossible for plagiarized content to be published under a different author's name. Security and transparency are paramount in StoryChain's design. The decentralized nature of blockchain technology ensures high levels of security for both transactions and data storage. All blockchain-related actions, including ownership transfers, donations, and publication records, are easily accessible and verifiable by users, promoting trust and accountability within the community. The platform also features separate dashboards for authors and readers. Authors can track their publications, view real-time analytics on readership and donations, and manage their earnings. Readers can curate their library, manage their donation history, and engage with their favorite authors. To aid user adoption, StoryChain provides comprehensive documentation, including user guides and FAQs that explain blockchain concepts, gas fees, and platform usage in accessible language. This educational aspect helps bridge the gap between traditional publishing and the Web3 ecosystem. Looking to the future, StoryChain plans to introduce additional features such as a native token economy to incentivize participation, expanded blockchain integration for faster and cheaper transactions, and enhanced social features to build a thriving community of writers and readers. By combining the security and transparency of blockchain technology with a user-friendly interface and direct support mechanisms, StoryChain aims to empower authors, delight readers, and usher in a new era of digital literature where creativity is fairly rewarded and intellectual property is securely protected.

This project was built upon Dynamic Scaffold Hackathon Starter edition.
It was a great beginning.

Deployed sepolia contract address <a href="https://sepolia.etherscan.io/address/0xda2c5aa97c73e555fe9a7f885be37b4f5587997d">0xda2c5aa97c73e555fe9a7f885be37b4f5587997d</a>


## Requirements

Before you begin, you need to install the following tools:

- [Node (>= v18.17)](https://nodejs.org/en/download/)
- Yarn ([v1](https://classic.yarnpkg.com/en/docs/install/) or [v2+](https://yarnpkg.com/getting-started/install))
- [Git](https://git-scm.com/downloads)

- You have to get a [Pimlico API key](https://dashboard.pimlico.io/sign-in) and put it in your env file (`NEXT_PUBLIC_PIMLICO_API_KEY`).
- You have to get a [Lighthouse Storage API key](https://docs.lighthouse.storage/lighthouse-1/how-to/create-an-api-key) and add it to the env file(`NEXT_PUBLIC_LIGHTHOUSE_API_KEY`)

- You should send some ERC20 (USDC is better) to your Safe smart wallet in order to use the transfer and cross-chain transfer capabilities.

- You can use the default Dynamic environment ID to test, but we recommend you add your own as soon as possible in the env file (NEXT_PUBLIC_DYNAMIC_ENVIRONMENT_ID)

## Quickstart

To get started with Scaffold-ETH 2 Hacker Edition, follow the steps below:

1. Clone this repo & install dependencies

```
git clone https://github.com/dynamic-labs/hackathon-starter-kit
cd hackathon-starter-kit
yarn install
```

2. Run a local network in the first terminal:

```
yarn chain
```

This command starts a local Ethereum network using Hardhat. The network runs on your local machine and can be used for testing and development. You can customize the network configuration in `hardhat.config.ts`.

3. On a second terminal, deploy the test contract:

```
yarn deploy
```

This command deploys a test smart contract to the local network. The contract is located in `packages/hardhat/contracts` and can be modified to suit your needs. The `yarn deploy` command uses the deploy script located in `packages/hardhat/deploy` to deploy the contract to the network. You can also customize the deploy script.

4. On a third terminal, start your NextJS app:

```
yarn start
```

Visit your app on: `http://localhost:3000`. You can interact with your smart contract using the `Debug Contracts` page. You can tweak the app config in `packages/nextjs/scaffold.config.ts`.



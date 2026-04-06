# Agentic RAG Lab

A dedicated local environment for building, testing, and deploying Retrieval-Augmented Generation (RAG) workflows and multi-agent systems. This project leverages hardware-accelerated computing on a dedicated local server to explore the intersection of vector search and autonomous AI agents.

## 🚀 Project Overview

The goal of this lab is to move beyond static RAG systems and implement "Agentic RAG"—equipping AI agents with tools, decision-making capabilities, and structured memory. 

### Core Tech Stack
* **OS:** Ubuntu 24.04 LTS (Dell OptiPlex 7050)
* **Compute:** NVIDIA Quadro M2000 (CUDA Accelerated)
* **Language:** Python 3.11
* **Frameworks:** LlamaIndex
* **Vector Database:** Milvus DB

---

## 📂 Repository Structure

This repository strictly adheres to the **Diátaxis** documentation framework to ensure clean, maintainable, and highly navigable knowledge management:

```text
docs/
├── explanation/          # High-level concepts and architectural discussions
│   └── rag-architecture.md
├── guides/               # Goal-oriented, step-by-step procedures
│   └── setup-nvidia.md
├── reference/            # Dry, factual technical specifications
│   ├── hardware-specs.md
│   ├── python-environment.md
│   └── ports-and-endpoints.md
└── tutorials/            # Learning-oriented, hands-on walkthroughs
    ├── creating-a-custom-agent-tool.md
    ├── hello-world-agent.md
    └── ingesting-documents-to-milvus.md



##### The Root README.md (The "Landing Page")

Project Goal: 
- A test lab on a Dell OptiPlex 7050 to understand Agentic RAG.
- Experimenting Agentic RAG server on Ubuntu 24.04.4 LTS

Hardware Baseline: 
- Dell OptiPlex 7050, i5 CPU, 120GB HD, 8GB RAM, and a single  Maxwell-architecture Quadro M2000.

############################################################################

+-------------------+----------------------------+-----------------------+
|  If the content…  |  …and serves the user’s…  | …then it must belong to… |
+-------------------+----------------------------+-----------------------+
| informs action    | acquisition of skill       | a tutorial            |
+-------------------+----------------------------+-----------------------+
| informs action    | application of skill       | a how-to guide        |
+-------------------+----------------------------+-----------------------+
| informs cognition | application of skill       | reference             |
+-------------------+----------------------------+-----------------------+
| informs cognition | acquisition of skill       | explanation           |
+-------------------+----------------------------+-----------------------+

##### 

As you can see from the map:

    tutorials and how-to guides are concerned with what the user does (action)

    reference and explanation are about what the user knows (cognition)

On the other hand:

    tutorials and explanation serve the acquistion of skill (the user’s study)

    how-to guides and reference serve the application of skill (the user’s work)




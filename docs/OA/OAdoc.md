# General documentation
In this document I will note my findings, research, plans, ... 
## Goal
### What
Integrate the molstar viewer (https://molstar.org/viewer/) inside of the Gemini project. 
Instead of using a remote database for the proteins, use a 'local' private azure database with different containers for different databases and also a local database (they would be probably get accessed with a http request).
Deploy gemini and modified molstar in a docker container.
#### Parts
I can divide this project into multiple parts to keep an overview.
1. Modify the Molstar package to change the remote database calls to ours data, stored in Azure containers. 
Ensure it can be easily extended with new azure containers and keeps working on new versions of Molstar.
2. Import the molstar viewer in the gemini GUI and connect with other parts of the GUI. 
3. Deploy Gemini and modified Molstar in a docker container.

### High-level roadmap
The ideal high-level timeline is as follows. This is subject to change when needed.
#### Part 1
1. Research on how to tackle this problem
2. Setup Molstar locally
3. Dig through Molstar code to understand the structure.
4. Independently send http requests to Azure.
5. Combine the Azure calls with molstar.
6. Find a way to make it easily modifiable, future-proof and extendable.
7. Document and finish
#### Part 2
1. Research on how to tackle this problem
2. Setup Gemini locally
3. Dig through Gemini code to understand the structure.
4. Integrate Molstar in Gemini 3d viewer
5. Connect Gemini logic to Molstar
6. Document and finish
#### Part 3
1. Research on how to tackle this problem
2. Add them both to a Docker container
3. Connect them
4. Ensure access from outside container
5. Document and finish.

## GUI expected
What is exactly expected from the 3D viewer GUI?
1. The user can select a structure from download structure
2. The user can select a density from download density
3. The user can use the same controls as in the Mol* viewer.
4. The user can display multiple structures to compare visually
5. The DNA sequence is visible

## Findings
### URL
There is a URL option in the download section to choose from. 
Here you could insert your own download path to avoid download from their server.
I intercepted the URL from their API call.
It was the following structure for 1tqn: 
https://www.ebi.ac.uk/pdbe/entry-files/download/1tqn.bcif
When I tried with the URL option with mmcif format and binary enabled, it actually worked.
If this works with our API call to Azure, then I could probably short circuit the other options and hardcode our path with the chosen name as parameter.
### Local folder
When the previous method doesn't work, there is maybe a Plan B to be tried.
There is a 'open files' option in the viewer where you could input a supported file from your local disk.
Potentionally I could write a script where the appropriate file is downloaded from Azure and then with this viewer option opened in the 3D viewer.



> Author: Simon Marien
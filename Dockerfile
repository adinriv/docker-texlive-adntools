FROM adnrv/texlive-tools
MAINTAINER adin

RUN mkdir ~/texmf/tex/latex
RUN cd ~/texmf/tex/latex

# Clone my repos
RUN git clone https://gitlab.com/adin/mcv-academic.git
RUN git clone https://gitlab.com/adin/adn-latex.git
RUN git clone https://gitlab.com/adin/tikz-fa.git

RUN cd
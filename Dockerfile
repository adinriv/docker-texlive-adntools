FROM adnrv/texlive-tools
MAINTAINER adin

RUN mkdir -p /usr/local/texlive/texmf-local/tex/latex/local

# Clone my repos
RUN git clone https://gitlab.com/adin/mcv-academic.git /usr/local/texlive/texmf-local/tex/latex/local/mcv-academic
RUN git clone https://gitlab.com/adin/adn-latex.git /usr/local/texlive/texmf/tex-local/latex/local/adn-latex
RUN git clone https://gitlab.com/adin/tikz-fa.git /usr/local/texlive/texmf/tex-local/latex/local/tikz-fa

RUN texhash


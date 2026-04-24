# Topology of Grounding — Paper Series

A research program on symbol grounding, cognitive distance, and structural conditions for representational comparability across heterogeneous cognitive systems.

## Papers

### Inference dynamics

- **`abduction_overwrite.tex`** — Abduction as overwrite: negative capability as a structural condition for reliable inference.
- **`abductive_accumulation.tex`** — Abductive accumulation: prior interpretive frames archived in a layered stack, with only the selection rule changing over time.
- **`ai_accumulation_note.tex`** — Short note on accumulation phenomena observed in AI systems.

### Implementation and architecture

- **`cgla_grounding.tex`** — Reconfigurable dataflow topology as a structural condition for universal sensory grounding: a theoretical argument for CGLA-class architectures.
- **`cogsci_unified.tex`** — Unified cognitive-science treatment of the framework, with RSA-based pilot evidence on Pythia checkpoints.

### Commentary

- **`compaction_commentary.tex`** — Commentary on compaction-related phenomena.

## Related repositories

- **[grounding-without-reality](https://github.com/minamominamoto/grounding-without-reality)** — Companion paper on grounding via closed action–consequence loops, hosted separately.

## Bibliography

- **`grounding.bib`** — Shared BibTeX file across papers in this repository.

## Building

Each `.tex` is self-contained. Compile with:

```bash
pdflatex paper_name.tex
```

LaTeX intermediate files (`.aux`, `.log`, `.out`, `.toc`) are gitignored.

## Repository layout

```
.
├── *.tex / *.pdf          # papers
├── grounding.bib          # shared bibliography
├── index.html             # GitHub Pages entry
├── update_traffic.sh      # repo metrics
├── .github/workflows/     # GitHub Actions (PDF auto-compile)
└── README.md
```

## Status

These papers are released as preprints. Some related papers in the same research program are under journal peer review and are hosted in a separate repository pending publication decisions.

## License

Code: MIT.
Manuscripts: see individual `.tex` headers.

## Contact

ORCID: [0009-0002-1201-5704](https://orcid.org/0009-0002-1201-5704)

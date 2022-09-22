app = typer.Typer()

@app.command()
def makedoc(doc_name: str):
    # TODO: Add doc generation and copying.
    print(f"Creating a doc named {doc_name}")

@app.command()
def get_ips(doc_name: str):
    # TODO: Add getting and displaying both private IP (if applicable) and public IP.
    print(f"Not implemented yet")


if __name__ == "__main__":
    app()

.class interface abstract Lcom/flyersoft/staticlayout/SHXMLReader;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# virtual methods
.method public abstract addExternalEntities(Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;)V"
        }
    .end annotation
.end method

.method public abstract characterDataHandler([CII)V
.end method

.method public abstract characterDataHandlerFinal([CII)V
.end method

.method public abstract dontCacheAttributeValues()Z
.end method

.method public abstract endDocumentHandler()V
.end method

.method public abstract endElementHandler(Ljava/lang/String;)Z
.end method

.method public abstract externalDTDs()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract namespaceMapChangedHandler(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract processNamespaces()Z
.end method

.method public abstract startDocumentHandler()V
.end method

.method public abstract startElementHandler(Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z
.end method

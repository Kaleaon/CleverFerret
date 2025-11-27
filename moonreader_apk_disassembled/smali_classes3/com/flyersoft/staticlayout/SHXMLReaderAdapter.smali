.class Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;
.super Ljava/lang/Object;
.source "HyphenationXML.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/SHXMLReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/SHXMLReaderAdapter$Predicate;
    }
.end annotation


# instance fields
.field private myNamespaceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1191
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;->myNamespaceMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addExternalEntities(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;)V"
        }
    .end annotation

    return-void
.end method

.method public characterDataHandler([CII)V
    .locals 0

    return-void
.end method

.method public characterDataHandlerFinal([CII)V
    .locals 0

    .line 1217
    invoke-virtual {p0, p1, p2, p3}, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;->characterDataHandler([CII)V

    return-void
.end method

.method public dontCacheAttributeValues()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public endDocumentHandler()V
    .locals 0

    return-void
.end method

.method public endElementHandler(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public externalDTDs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1283
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method protected getAttributeValue(Lcom/flyersoft/staticlayout/SHStringMap;Lcom/flyersoft/staticlayout/SHXMLReaderAdapter$Predicate;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1261
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHStringMap;->getSize()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 1265
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    .line 1267
    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/SHStringMap;->getKey(I)Ljava/lang/String;

    move-result-object v2

    .line 1268
    invoke-virtual {v2, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1269
    iget-object v3, p0, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;->myNamespaceMap:Ljava/util/Map;

    .line 1270
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1271
    invoke-interface {p2, v2}, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter$Predicate;->accepts(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1272
    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/SHStringMap;->getValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public getAttributeValue(Lcom/flyersoft/staticlayout/SHStringMap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    if-nez p2, :cond_0

    .line 1236
    invoke-virtual {p1, p3}, Lcom/flyersoft/staticlayout/SHStringMap;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1239
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHStringMap;->getSize()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return-object v1

    .line 1243
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_3

    .line 1245
    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/SHStringMap;->getKey(I)Ljava/lang/String;

    move-result-object v2

    .line 1246
    invoke-virtual {v2, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1247
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1248
    iget-object v3, p0, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;->myNamespaceMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1249
    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/SHStringMap;->getValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    return-object v1
.end method

.method public namespaceMapChangedHandler(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    goto :goto_0

    .line 1231
    :cond_0
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    :goto_0
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;->myNamespaceMap:Ljava/util/Map;

    return-void
.end method

.method public processNamespaces()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public read(Lcom/flyersoft/staticlayout/SHFile;)Z
    .locals 0

    .line 1194
    invoke-static {p0, p1}, Lcom/flyersoft/staticlayout/SHXMLProcessor;->read(Lcom/flyersoft/staticlayout/SHXMLReader;Lcom/flyersoft/staticlayout/SHFile;)Z

    move-result p1

    return p1
.end method

.method public read(Ljava/io/InputStream;)Z
    .locals 1

    const/high16 v0, 0x10000

    .line 1198
    invoke-static {p0, p1, v0}, Lcom/flyersoft/staticlayout/SHXMLProcessor;->read(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/io/InputStream;I)Z

    move-result p1

    return p1
.end method

.method public startDocumentHandler()V
    .locals 0

    return-void
.end method

.method public startElementHandler(Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

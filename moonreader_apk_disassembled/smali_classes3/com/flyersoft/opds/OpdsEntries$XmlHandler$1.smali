.class Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;
.super Ljava/lang/Thread;
.source "OpdsEntries.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->getSearchUrl(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/opds/OpdsEntries$XmlHandler;

.field final synthetic val$href:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/opds/OpdsEntries$XmlHandler;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 357
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->this$1:Lcom/flyersoft/opds/OpdsEntries$XmlHandler;

    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->val$href:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 360
    const-string v0, "\""

    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->val$href:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getUrlText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 363
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->this$1:Lcom/flyersoft/opds/OpdsEntries$XmlHandler;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->val$href:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/opds/OpdsSite;->openSearchUrl:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 367
    :cond_1
    const-string v4, "{searchTerms}"

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    .line 369
    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v2

    .line 370
    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v2, v2, 0x1

    .line 371
    invoke-virtual {v1, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 372
    const-string v5, "<"

    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v5

    .line 373
    const-string v6, ">"

    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    add-int/lit8 v5, v5, 0x1

    .line 374
    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 375
    const-string v6, "application/atom+xml"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v4, :cond_1

    :cond_2
    if-eqz v2, :cond_3

    .line 381
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->this$1:Lcom/flyersoft/opds/OpdsEntries$XmlHandler;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;->val$href:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/opds/OpdsSite;->searchUrl:Ljava/lang/String;

    .line 382
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 383
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    sget v1, Lcom/flyersoft/moonreaderp/ActivityMain;->DOWNLOAD_OPEN_SEARCH_RESULT:I

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 386
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    return-void
.end method

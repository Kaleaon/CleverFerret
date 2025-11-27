.class Lcom/dropbox/core/v1/DbxClientV1$13;
.super Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/v1/DbxClientV1;->getRevisions(Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxRequestUtil$ResponseHandler<",
        "Ljava/util/List<",
        "Lcom/dropbox/core/v1/DbxEntry$File;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dropbox/core/v1/DbxClientV1;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;)V
    .locals 0

    .line 1821
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$13;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    invoke-direct {p0}, Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1821
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxClientV1$13;->handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/http/HttpRequestor$Response;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1825
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 1826
    new-instance v0, Lcom/dropbox/core/util/Collector$ArrayListCollector;

    invoke-direct {v0}, Lcom/dropbox/core/util/Collector$ArrayListCollector;-><init>()V

    .line 1827
    invoke-static {v0}, Lcom/dropbox/core/util/Collector$NullSkipper;->mk(Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/util/Collector;

    move-result-object v0

    .line 1828
    sget-object v1, Lcom/dropbox/core/v1/DbxEntry$File;->ReaderMaybeDeleted:Lcom/dropbox/core/json/JsonReader;

    invoke-static {v1, v0}, Lcom/dropbox/core/json/JsonArrayReader;->mk(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/json/JsonArrayReader;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/dropbox/core/DbxRequestUtil;->readJsonFromResponse(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1

    .line 1825
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/DbxException;

    move-result-object p1

    throw p1
.end method

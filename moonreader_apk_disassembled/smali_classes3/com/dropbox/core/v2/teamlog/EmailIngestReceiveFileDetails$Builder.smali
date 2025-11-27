.class public Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;
.super Ljava/lang/Object;
.source "EmailIngestReceiveFileDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final attachmentNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected fromEmail:Ljava/lang/String;

.field protected fromName:Ljava/lang/String;

.field protected final inboxName:Ljava/lang/String;

.field protected subject:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 178
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->inboxName:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 182
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'attachmentNames\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 187
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->attachmentNames:Ljava/util/List;

    const/4 p1, 0x0

    .line 188
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->subject:Ljava/lang/String;

    .line 189
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromName:Ljava/lang/String;

    .line 190
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromEmail:Ljava/lang/String;

    return-void

    .line 180
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'attachmentNames\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 176
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'inboxName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails;
    .locals 6

    .line 245
    new-instance v0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->inboxName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->attachmentNames:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->subject:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromName:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromEmail:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withFromEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 230
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 231
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'fromEmail\' is longer than 255"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 234
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromEmail:Ljava/lang/String;

    return-object p0
.end method

.method public withFromName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;
    .locals 0

    .line 213
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->fromName:Ljava/lang/String;

    return-object p0
.end method

.method public withSubject(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;
    .locals 0

    .line 201
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/EmailIngestReceiveFileDetails$Builder;->subject:Ljava/lang/String;

    return-object p0
.end method

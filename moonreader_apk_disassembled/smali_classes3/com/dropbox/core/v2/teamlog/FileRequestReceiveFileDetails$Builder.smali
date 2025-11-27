.class public Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
.super Ljava/lang/Object;
.source "FileRequestReceiveFileDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

.field protected fileRequestId:Ljava/lang/String;

.field protected final submittedFileNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected submitterEmail:Ljava/lang/String;

.field protected submitterName:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 184
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'submittedFileNames\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 189
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submittedFileNames:Ljava/util/List;

    const/4 p1, 0x0

    .line 190
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestId:Ljava/lang/String;

    .line 191
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    .line 192
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterName:Ljava/lang/String;

    .line 193
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterEmail:Ljava/lang/String;

    return-void

    .line 182
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'submittedFileNames\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;
    .locals 6

    .line 274
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submittedFileNames:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterName:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterEmail:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;-><init>(Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withFileRequestDetails(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    .locals 0

    .line 230
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-object p0
.end method

.method public withFileRequestId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 213
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 214
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'fileRequestId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 211
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'fileRequestId\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 217
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->fileRequestId:Ljava/lang/String;

    return-object p0
.end method

.method public withSubmitterEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 259
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 260
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'submitterEmail\' is longer than 255"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 263
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterEmail:Ljava/lang/String;

    return-object p0
.end method

.method public withSubmitterName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    .locals 0

    .line 242
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;->submitterName:Ljava/lang/String;

    return-object p0
.end method

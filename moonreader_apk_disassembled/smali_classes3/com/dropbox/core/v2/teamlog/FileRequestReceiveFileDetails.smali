.class public Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;
.super Ljava/lang/Object;
.source "FileRequestReceiveFileDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    }
.end annotation


# instance fields
.field protected final fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final fileRequestId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final submittedFileNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final submitterEmail:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final submitterName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 101
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;-><init>(Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/teamlog/FileRequestDetails;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_2

    .line 62
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 65
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileRequestId\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 63
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileRequestId\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 69
    :cond_2
    :goto_0
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestId:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    if-eqz p1, :cond_7

    .line 74
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_3

    goto :goto_1

    .line 76
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'submittedFileNames\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 79
    :cond_4
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submittedFileNames:Ljava/util/List;

    .line 80
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterName:Ljava/lang/String;

    if-eqz p5, :cond_6

    .line 82
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0xff

    if-gt p1, p2, :cond_5

    goto :goto_2

    .line 83
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'submitterEmail\' is longer than 255"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_6
    :goto_2
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterEmail:Ljava/lang/String;

    return-void

    .line 72
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'submittedFileNames\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;"
        }
    .end annotation

    .line 166
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Builder;-><init>(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 299
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 300
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;

    .line 301
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submittedFileNames:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submittedFileNames:Ljava/util/List;

    if-eq v2, v3, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_6

    .line 302
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_6

    .line 303
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/FileRequestDetails;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterName:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_6

    .line 304
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterEmail:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterEmail:Ljava/lang/String;

    if-eq v2, p1, :cond_7

    if-eqz v2, :cond_6

    .line 305
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    return v1

    :cond_7
    :goto_0
    return v0

    :cond_8
    return v1
.end method

.method public getFileRequestDetails()Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-object v0
.end method

.method public getFileRequestId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestId:Ljava/lang/String;

    return-object v0
.end method

.method public getSubmittedFileNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submittedFileNames:Ljava/util/List;

    return-object v0
.end method

.method public getSubmitterEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getSubmitterName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 280
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->fileRequestDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submittedFileNames:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails;->submitterEmail:Ljava/lang/String;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 315
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 327
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileRequestReceiveFileDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

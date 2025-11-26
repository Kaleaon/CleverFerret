.class public Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;
.super Ljava/lang/Object;
.source "FileRequestChangeDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Builder;
    }
.end annotation


# instance fields
.field protected final fileRequestId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;-><init>(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)V
    .locals 2
    .param p1    # Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
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

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_2

    .line 53
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 56
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileRequestId\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileRequestId\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 60
    :cond_2
    :goto_0
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->fileRequestId:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    if-eqz p1, :cond_3

    .line 65
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-void

    .line 63
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newDetails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Builder;
    .locals 1

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)V

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

    .line 213
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 214
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;

    .line 215
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/FileRequestDetails;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->fileRequestId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->fileRequestId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_4

    .line 216
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 217
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/FileRequestDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getFileRequestId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->fileRequestId:Ljava/lang/String;

    return-object v0
.end method

.method public getNewDetails()Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-object v0
.end method

.method public getPreviousDetails()Lcom/dropbox/core/v2/teamlog/FileRequestDetails;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->fileRequestId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails;->newDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 239
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileRequestChangeDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

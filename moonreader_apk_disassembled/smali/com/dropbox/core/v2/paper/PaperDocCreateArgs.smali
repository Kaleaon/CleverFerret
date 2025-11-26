.class Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;
.super Ljava/lang/Object;
.source "PaperDocCreateArgs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;
    }
.end annotation


# instance fields
.field protected final importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final parentFolderId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/paper/ImportFormat;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/paper/ImportFormat;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;-><init>(Lcom/dropbox/core/v2/paper/ImportFormat;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/paper/ImportFormat;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/paper/ImportFormat;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->parentFolderId:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 46
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;

    return-void

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'importFormat\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 103
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 104
    check-cast p1, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;

    .line 105
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;

    iget-object v3, p1, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/paper/ImportFormat;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->parentFolderId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->parentFolderId:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 106
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getImportFormat()Lcom/dropbox/core/v2/paper/ImportFormat;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;

    return-object v0
.end method

.method public getParentFolderId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->parentFolderId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 87
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->parentFolderId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;->importFormat:Lcom/dropbox/core/v2/paper/ImportFormat;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 116
    sget-object v0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 128
    sget-object v0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

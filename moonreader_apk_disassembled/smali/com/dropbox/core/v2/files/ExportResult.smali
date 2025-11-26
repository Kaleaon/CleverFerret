.class public Lcom/dropbox/core/v2/files/ExportResult;
.super Ljava/lang/Object;
.source "ExportResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ExportResult$Serializer;
    }
.end annotation


# instance fields
.field protected final exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/ExportMetadata;Lcom/dropbox/core/v2/files/FileMetadata;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/ExportMetadata;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/FileMetadata;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 43
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportResult;->exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;

    if-eqz p2, :cond_0

    .line 47
    iput-object p2, p0, Lcom/dropbox/core/v2/files/ExportResult;->fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;

    return-void

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'fileMetadata\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 41
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'exportMetadata\' is null"

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

    .line 88
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 89
    check-cast p1, Lcom/dropbox/core/v2/files/ExportResult;

    .line 90
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportResult;->exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ExportResult;->exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ExportMetadata;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportResult;->fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ExportResult;->fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;

    if-eq v2, p1, :cond_4

    .line 91
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/FileMetadata;->equals(Ljava/lang/Object;)Z

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

.method public getExportMetadata()Lcom/dropbox/core/v2/files/ExportMetadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportResult;->exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;

    return-object v0
.end method

.method public getFileMetadata()Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportResult;->fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 72
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportResult;->exportMetadata:Lcom/dropbox/core/v2/files/ExportMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ExportResult;->fileMetadata:Lcom/dropbox/core/v2/files/FileMetadata;

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

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/files/ExportResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ExportResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 113
    sget-object v0, Lcom/dropbox/core/v2/files/ExportResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ExportResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.class Lcom/dropbox/core/v2/files/PaperUpdateArg;
.super Ljava/lang/Object;
.source "PaperUpdateArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;
    }
.end annotation


# instance fields
.field protected final docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final importFormat:Lcom/dropbox/core/v2/files/ImportFormat;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final paperRevision:Ljava/lang/Long;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final path:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/ImportFormat;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 89
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v2/files/PaperUpdateArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Ljava/lang/Long;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Ljava/lang/Long;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/ImportFormat;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 56
    const-string v0, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)|(id:.*)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 59
    iput-object p1, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 63
    iput-object p2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    if-eqz p3, :cond_0

    .line 67
    iput-object p3, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    .line 68
    iput-object p4, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    return-void

    .line 65
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'docUpdatePolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'importFormat\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'path\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'path\' is null"

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

    .line 155
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 156
    check-cast p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;

    .line 157
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    if-eq v2, v3, :cond_3

    .line 158
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ImportFormat;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    if-eq v2, v3, :cond_4

    .line 159
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 160
    invoke-virtual {v2, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getDocUpdatePolicy()Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    return-object v0
.end method

.method public getImportFormat()Lcom/dropbox/core/v2/files/ImportFormat;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    return-object v0
.end method

.method public getPaperRevision()Ljava/lang/Long;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 137
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 170
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 182
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

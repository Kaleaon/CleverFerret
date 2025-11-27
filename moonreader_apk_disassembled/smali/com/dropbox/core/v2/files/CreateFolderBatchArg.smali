.class Lcom/dropbox/core/v2/files/CreateFolderBatchArg;
.super Ljava/lang/Object;
.source "CreateFolderBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;,
        Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;
    }
.end annotation


# instance fields
.field protected final autorename:Z

.field protected final forceAsync:Z

.field protected final paths:Ljava/util/List;
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


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
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

    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;-><init>(Ljava/util/List;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZZ)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;ZZ)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_3

    .line 52
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 56
    const-string v2, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)"

    invoke-static {v2, v1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Stringan item in list \'paths\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'paths\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 60
    :cond_2
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->paths:Ljava/util/List;

    .line 61
    iput-boolean p2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->autorename:Z

    .line 62
    iput-boolean p3, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->forceAsync:Z

    return-void

    .line 50
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "List \'paths\' has more than 10000 items"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 47
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'paths\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;"
        }
    .end annotation

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;-><init>(Ljava/util/List;)V

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

    .line 234
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 235
    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;

    .line 236
    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->paths:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->paths:Ljava/util/List;

    if-eq v2, v3, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->autorename:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->autorename:Z

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->forceAsync:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->forceAsync:Z

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getAutorename()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->autorename:Z

    return v0
.end method

.method public getForceAsync()Z
    .locals 1

    .line 111
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->forceAsync:Z

    return v0
.end method

.method public getPaths()Ljava/util/List;
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

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->paths:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 217
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->paths:Ljava/util/List;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->autorename:Z

    .line 219
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->forceAsync:Z

    .line 220
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 217
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 248
    sget-object v0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 260
    sget-object v0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

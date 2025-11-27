.class public Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;
.super Ljava/lang/Object;
.source "CreateFolderBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/CreateFolderBatchArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected autorename:Z

.field protected forceAsync:Z

.field protected final paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 144
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_3

    .line 147
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

    .line 151
    const-string v2, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)"

    invoke-static {v2, v1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 152
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list \'paths\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'paths\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_2
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->paths:Ljava/util/List;

    const/4 p1, 0x0

    .line 156
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->autorename:Z

    .line 157
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->forceAsync:Z

    return-void

    .line 145
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "List \'paths\' has more than 10000 items"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 142
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'paths\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/CreateFolderBatchArg;
    .locals 4

    .line 211
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->paths:Ljava/util/List;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->autorename:Z

    iget-boolean v3, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->forceAsync:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;-><init>(Ljava/util/List;ZZ)V

    return-object v0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 174
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->autorename:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 177
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->autorename:Z

    return-object p0
.end method

.method public withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 196
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->forceAsync:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 199
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->forceAsync:Z

    return-object p0
.end method

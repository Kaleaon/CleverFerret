.class public Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;
.super Ljava/lang/Object;
.source "MoveBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/MoveBatchArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected allowOwnershipTransfer:Z

.field protected autorename:Z

.field protected final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)V"
        }
    .end annotation

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_3

    .line 132
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x3e8

    if-gt v0, v1, :cond_2

    .line 135
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/files/RelocationPath;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'entries\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 140
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->entries:Ljava/util/List;

    const/4 p1, 0x0

    .line 141
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->autorename:Z

    .line 142
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->allowOwnershipTransfer:Z

    return-void

    .line 133
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "List \'entries\' has more than 1000 items"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 130
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "List \'entries\' has fewer than 1 items"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 127
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'entries\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/MoveBatchArg;
    .locals 4

    .line 197
    new-instance v0, Lcom/dropbox/core/v2/files/MoveBatchArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->entries:Ljava/util/List;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->autorename:Z

    iget-boolean v3, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->allowOwnershipTransfer:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/MoveBatchArg;-><init>(Ljava/util/List;ZZ)V

    return-object v0
.end method

.method public withAllowOwnershipTransfer(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 182
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->allowOwnershipTransfer:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 185
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->allowOwnershipTransfer:Z

    return-object p0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 159
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->autorename:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 162
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;->autorename:Z

    return-object p0
.end method

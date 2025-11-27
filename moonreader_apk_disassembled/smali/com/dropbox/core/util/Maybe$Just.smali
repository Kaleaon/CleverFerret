.class final Lcom/dropbox/core/util/Maybe$Just;
.super Lcom/dropbox/core/util/Maybe;
.source "Maybe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/util/Maybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Just"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/dropbox/core/util/Maybe<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0}, Lcom/dropbox/core/util/Maybe;-><init>(Lcom/dropbox/core/util/Maybe$1;)V

    .line 25
    iput-object p1, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/dropbox/core/util/Maybe$1;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/dropbox/core/util/Maybe$Just;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public equals(Lcom/dropbox/core/util/Maybe;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/util/Maybe<",
            "TT;>;)Z"
        }
    .end annotation

    .line 38
    instance-of v0, p1, Lcom/dropbox/core/util/Maybe$Just;

    if-eqz v0, :cond_0

    .line 39
    check-cast p1, Lcom/dropbox/core/util/Maybe$Just;

    .line 40
    iget-object v0, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    iget-object p1, p1, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/dropbox/core/util/LangUtil;->nullableEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 42
    :cond_0
    instance-of v0, p1, Lcom/dropbox/core/util/Maybe$Nothing;

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 46
    :cond_1
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->badType(Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .line 31
    iget-object p1, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    return-object p1
.end method

.method public getJust()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    invoke-static {v0}, Lcom/dropbox/core/util/LangUtil;->nullableHashCode(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isJust()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isNothing()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Just("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/dropbox/core/util/Maybe$Just;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

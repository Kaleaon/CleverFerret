.class public Lcom/vladsch/flexmark/util/options/DataKey;
.super Ljava/lang/Object;
.source "DataKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    const/4 p1, 0x0

    .line 12
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/collection/DataValueFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    .line 13
    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/DataKey;->factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;)V"
        }
    .end annotation

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey$1;

    invoke-direct {v0, p2}, Lcom/vladsch/flexmark/util/options/DataKey$1;-><init>(Lcom/vladsch/flexmark/util/options/DataKey;)V

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    .line 39
    new-instance p1, Lcom/vladsch/flexmark/util/options/DataKey$2;

    invoke-direct {p1, p0, p2}, Lcom/vladsch/flexmark/util/options/DataKey$2;-><init>(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getDefaultValue(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TT;"
        }
    .end annotation

    .line 56
    iget-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    return-object p1
.end method

.method public getFactory()Lcom/vladsch/flexmark/util/collection/DataValueFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey;->factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    return-object v0
.end method

.method public getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TT;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 64
    iget-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    return-object p1

    :cond_0
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 89
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 90
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 91
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 92
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    const-string v1, "> "

    const-string v2, "DataKey<"

    if-eqz v0, :cond_0

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vladsch/flexmark/util/options/DataKey;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey;->factory:Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/collection/DataValueFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 76
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DataKey<unknown> "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/DataKey;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

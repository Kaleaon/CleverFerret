.class public Lcom/flyersoft/books/chmlib/XMLNode;
.super Ljava/lang/Object;
.source "XMLNode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/XMLNode$Tag;
    }
.end annotation


# static fields
.field public static count:I


# instance fields
.field public attributes:[Ljava/lang/String;

.field public children:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/chmlib/XMLNode;",
            ">;"
        }
    .end annotation
.end field

.field public parent:Lcom/flyersoft/books/chmlib/XMLNode;

.field public tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public tagStr:Ljava/lang/String;

.field public text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 56
    invoke-static {}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->fixDependancy()V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    sget v0, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    .line 74
    rem-int/lit16 v0, v0, 0x3e8

    if-nez v0, :cond_0

    .line 75
    sget-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "XMLNode.count="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget v0, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    .line 69
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/books/chmlib/XMLNode;)V
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    iput-object p0, p1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    return-void
.end method

.method public compact()V
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    :cond_0
    return-void
.end method

.method public findChild(Lcom/flyersoft/books/chmlib/XMLNode$Tag;)Lcom/flyersoft/books/chmlib/XMLNode;
    .locals 3

    .line 127
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 128
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/XMLNode;

    .line 129
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-ne p1, v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 119
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 120
    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    aget-object p1, p1, v0

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTagStr()Ljava/lang/String;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->tagStr:Ljava/lang/String;

    return-object v0
.end method

.method public setAttributes(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 100
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 102
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    return-void
.end method

.method public setAttributes(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 107
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    if-nez v0, :cond_1

    .line 110
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    .line 112
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 113
    iget-object v3, p0, Lcom/flyersoft/books/chmlib/XMLNode;->attributes:[Ljava/lang/String;

    add-int/lit8 v4, v1, 0x1

    aput-object v2, v3, v1

    add-int/lit8 v1, v1, 0x2

    .line 114
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aput-object v2, v3, v4

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 1

    .line 79
    invoke-static {p1}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->getByValue(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-nez v0, :cond_0

    .line 81
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/XMLNode;->tagStr:Ljava/lang/String;

    :cond_0
    return-void
.end method

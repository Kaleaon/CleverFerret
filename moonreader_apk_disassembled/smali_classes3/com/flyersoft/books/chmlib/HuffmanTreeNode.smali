.class public Lcom/flyersoft/books/chmlib/HuffmanTreeNode;
.super Ljava/lang/Object;
.source "HuffmanTreeNode.java"


# instance fields
.field public left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

.field public right:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

.field public value:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->value:I

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    .line 19
    iput-object p2, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->right:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    return-void
.end method

.method public static build([I)Lcom/flyersoft/books/chmlib/HuffmanTreeNode;
    .locals 8

    const/16 v0, 0x11

    .line 48
    new-array v1, v0, [Ljava/util/List;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 50
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 52
    :goto_1
    array-length v3, p0

    if-ge v0, v3, :cond_2

    .line 53
    aget v3, p0, v0

    if-nez v3, :cond_1

    goto :goto_2

    .line 55
    :cond_1
    aget-object v3, v1, v3

    new-instance v4, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-direct {v4, v0}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;-><init>(I)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    const/16 p0, 0x10

    :goto_3
    const/4 v0, 0x0

    if-lez p0, :cond_6

    .line 59
    aget-object v3, v1, p0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_3

    goto :goto_6

    :cond_3
    const/4 v3, 0x0

    .line 61
    :goto_4
    aget-object v4, v1, p0

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 62
    aget-object v4, v1, p0

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    .line 63
    aget-object v5, v1, p0

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v3, v5, :cond_4

    aget-object v5, v1, p0

    add-int/lit8 v6, v3, 0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_5

    :cond_4
    move-object v5, v0

    :goto_5
    add-int/lit8 v6, p0, -0x1

    .line 64
    aget-object v6, v1, v6

    new-instance v7, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-direct {v7, v4, v5}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;-><init>(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x2

    goto :goto_4

    :cond_5
    :goto_6
    add-int/lit8 p0, p0, -0x1

    goto :goto_3

    .line 67
    :cond_6
    aget-object p0, v1, v2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-nez p0, :cond_7

    return-object v0

    .line 70
    :cond_7
    aget-object p0, v1, v2

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    return-object p0
.end method


# virtual methods
.method public decode(Lcom/flyersoft/books/chmlib/BitBuffer;)I
    .locals 2

    move-object v0, p0

    .line 24
    :goto_0
    iget-object v1, v0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    if-eqz v1, :cond_1

    .line 25
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/BitBuffer;->read()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->right:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_0

    .line 27
    :cond_1
    iget p1, v0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->value:I

    return p1
.end method

.method public decode_recursive(Lcom/flyersoft/books/chmlib/BitBuffer;)I
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    if-nez v0, :cond_0

    .line 38
    iget p1, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->value:I

    return p1

    .line 40
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/BitBuffer;->read()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->right:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    :goto_0
    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->decode(Lcom/flyersoft/books/chmlib/BitBuffer;)I

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_0
.end method

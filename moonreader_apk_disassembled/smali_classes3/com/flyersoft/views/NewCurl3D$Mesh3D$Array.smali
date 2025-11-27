.class Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D$Mesh3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Array"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mArray:[Ljava/lang/Object;

.field private mCapacity:I

.field private mSize:I

.field final synthetic this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 1818
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1819
    iput p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mCapacity:I

    .line 1820
    new-array p1, p2, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    if-ltz p1, :cond_1

    .line 1824
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    if-gt p1, v0, :cond_1

    iget v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mCapacity:I

    if-ge v0, v1, :cond_1

    :goto_0
    if-le v0, p1, :cond_0

    .line 1828
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    add-int/lit8 v2, v0, -0x1

    aget-object v2, v1, v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1830
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    aput-object p2, v0, p1

    .line 1831
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    return-void

    .line 1825
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public add(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1835
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    iget v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mCapacity:I

    if-ge v0, v1, :cond_0

    .line 1838
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    aput-object p1, v1, v0

    return-void

    .line 1836
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "TT;>;)V"
        }
    .end annotation

    .line 1842
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mCapacity:I

    if-gt v0, v1, :cond_1

    const/4 v0, 0x0

    .line 1845
    :goto_0
    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1846
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    iget v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 1843
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 1851
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    if-ltz p1, :cond_0

    .line 1856
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    if-ge p1, v0, :cond_0

    .line 1859
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1

    .line 1857
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    if-ltz p1, :cond_1

    .line 1864
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    if-ge p1, v0, :cond_1

    .line 1867
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 1868
    :goto_0
    iget v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    add-int/lit8 v2, v1, -0x1

    if-ge p1, v2, :cond_0

    .line 1869
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mArray:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    aget-object v3, v1, v2

    aput-object v3, v1, p1

    move p1, v2

    goto :goto_0

    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 1871
    iput v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    return-object v0

    .line 1865
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public size()I
    .locals 1

    .line 1876
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->mSize:I

    return v0
.end method

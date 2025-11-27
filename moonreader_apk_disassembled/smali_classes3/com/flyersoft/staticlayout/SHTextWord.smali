.class final Lcom/flyersoft/staticlayout/SHTextWord;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# instance fields
.field public final Data:[C

.field public final Length:I

.field public final Offset:I


# direct methods
.method public constructor <init>([CII)V
    .locals 0

    .line 757
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 758
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    .line 759
    iput p2, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    .line 760
    iput p3, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    return-void
.end method


# virtual methods
.method public isAWord()Z
    .locals 3

    .line 764
    iget v0, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    :goto_0
    iget v1, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    iget v2, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_1

    .line 765
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    aget-char v1, v1, v0

    invoke-static {v1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 773
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    iget v2, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    iget v3, p0, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

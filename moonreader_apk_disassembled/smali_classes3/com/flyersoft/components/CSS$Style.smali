.class public Lcom/flyersoft/components/CSS$Style;
.super Ljava/lang/Object;
.source "CSS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/CSS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Style"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/CSS$Style$Border;
    }
.end annotation


# instance fields
.field public align:I

.field public background:Ljava/lang/String;

.field public backgroundColor:Ljava/lang/String;

.field public backgroundImage:Ljava/lang/String;

.field public backgroundPosition:Ljava/lang/String;

.field public bold:Z

.field public border:Landroid/graphics/RectF;

.field public borderColor:[Ljava/lang/String;

.field public borderRadius:Ljava/lang/Float;

.field public borderStyle:[Ljava/lang/String;

.field public color:Ljava/lang/String;

.field public css_text:Ljava/lang/String;

.field public display:Ljava/lang/String;

.field public emphasis_style:Ljava/lang/String;

.field public floatSp:Ljava/lang/String;

.field public fontFace:Ljava/lang/String;

.field public fontSize:F

.field public fontSizeInherited:Z

.field public fontStyleNormal:Z

.field public fontWeight:Ljava/lang/String;

.field public height:Ljava/lang/String;

.field public htmlEndPos:I

.field public htmlStartPos:I

.field public indent:Ljava/lang/Float;

.field public italic:Z

.field public margin:Landroid/graphics/RectF;

.field public marginInherited:Landroid/graphics/RectF;

.field public maxWidth:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public noindent:Z

.field public padding:Landroid/graphics/RectF;

.field public paddingInherited:Landroid/graphics/RectF;

.field public pageBreak:I

.field public shadow:Ljava/lang/String;

.field public strikethrough:Z

.field public text_fill_color:Ljava/lang/String;

.field public ul_style:Ljava/lang/String;

.field public underline:Z

.field public width:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$misBorderSize(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$misCssColor(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS$Style;->isCssColor(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    .line 250
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    .line 251
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    .line 252
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    .line 254
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/components/CSS$Style;)V
    .locals 1

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    .line 250
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    .line 251
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    .line 252
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    .line 254
    invoke-static {}, Lcom/flyersoft/components/CSS;->emptyMargin()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    if-eqz p1, :cond_0

    .line 271
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/CSS$Style;->combineStyle(Lcom/flyersoft/components/CSS$Style;)V

    :cond_0
    return-void
.end method

.method private deleteBlanksInBrackets(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 988
    :goto_0
    const-string v2, "("

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    goto :goto_1

    .line 991
    :cond_0
    const-string v4, ")"

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v3, :cond_1

    :goto_1
    return-object p1

    .line 994
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v5, " "

    const-string v6, ""

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private getBorderAndBackground(Ljava/lang/String;)V
    .locals 11

    .line 705
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_0

    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    .line 706
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    if-nez v0, :cond_1

    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    .line 708
    :cond_1
    const-string v0, "border"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 709
    const-string v2, " +"

    const/4 v3, -0x1

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eq v0, v3, :cond_6

    add-int/lit8 v0, v0, 0x7

    .line 710
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 711
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 712
    array-length v8, v0

    if-ne v8, v6, :cond_3

    .line 713
    aget-object v8, v0, v7

    invoke-direct {p0, v8}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 714
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v8, Landroid/graphics/RectF;->right:F

    iput v0, v8, Landroid/graphics/RectF;->left:F

    iput v0, v8, Landroid/graphics/RectF;->bottom:F

    iput v0, v8, Landroid/graphics/RectF;->top:F

    goto/16 :goto_0

    .line 716
    :cond_2
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v8, v4

    aput-object v0, v8, v5

    aput-object v0, v8, v6

    aput-object v0, v8, v7

    goto/16 :goto_0

    .line 717
    :cond_3
    array-length v8, v0

    if-ne v8, v5, :cond_5

    .line 718
    aget-object v8, v0, v7

    invoke-direct {p0, v8}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 719
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v7

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    iput v9, v8, Landroid/graphics/RectF;->left:F

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 720
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v8, v4

    aput-object v0, v8, v5

    aput-object v0, v8, v6

    aput-object v0, v8, v7

    goto :goto_0

    .line 722
    :cond_4
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v0, v7

    aput-object v9, v8, v4

    aput-object v9, v8, v5

    aput-object v9, v8, v6

    aput-object v9, v8, v7

    .line 723
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v8, v4

    aput-object v0, v8, v6

    aput-object v0, v8, v5

    aput-object v0, v8, v7

    goto :goto_0

    .line 725
    :cond_5
    array-length v8, v0

    if-ne v8, v4, :cond_6

    .line 726
    new-instance v8, Lcom/flyersoft/components/CSS$Style$Border;

    invoke-direct {v8, p0, v0}, Lcom/flyersoft/components/CSS$Style$Border;-><init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V

    .line 727
    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v10, v8, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    aget-object v10, v0, v10

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v10

    iput v10, v9, Landroid/graphics/RectF;->right:F

    iput v10, v9, Landroid/graphics/RectF;->left:F

    iput v10, v9, Landroid/graphics/RectF;->bottom:F

    iput v10, v9, Landroid/graphics/RectF;->top:F

    .line 728
    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget v10, v8, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    aget-object v10, v0, v10

    aput-object v10, v9, v4

    aput-object v10, v9, v5

    aput-object v10, v9, v6

    aput-object v10, v9, v7

    .line 729
    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget v8, v8, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    aget-object v0, v0, v8

    aput-object v0, v9, v4

    aput-object v0, v9, v6

    aput-object v0, v9, v5

    aput-object v0, v9, v7

    .line 733
    :cond_6
    :goto_0
    const-string v0, "border-radius"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_7

    add-int/lit8 v0, v0, 0xe

    .line 734
    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    .line 736
    :cond_7
    const-string v0, "border-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_b

    add-int/lit8 v0, v0, 0xd

    .line 738
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 739
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 740
    array-length v8, v0

    if-ne v8, v1, :cond_8

    .line 741
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v0, v4

    aput-object v9, v8, v7

    .line 742
    aget-object v9, v0, v7

    aput-object v9, v8, v6

    .line 743
    aget-object v9, v0, v6

    aput-object v9, v8, v5

    .line 744
    aget-object v0, v0, v5

    aput-object v0, v8, v4

    goto :goto_1

    .line 745
    :cond_8
    array-length v8, v0

    if-ne v8, v4, :cond_9

    .line 746
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v0, v7

    aput-object v9, v8, v6

    .line 747
    aget-object v9, v0, v6

    aput-object v9, v8, v5

    aput-object v9, v8, v7

    .line 748
    aget-object v0, v0, v5

    aput-object v0, v8, v4

    goto :goto_1

    .line 749
    :cond_9
    array-length v8, v0

    if-ne v8, v5, :cond_a

    .line 750
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v0, v7

    aput-object v9, v8, v4

    aput-object v9, v8, v6

    .line 751
    aget-object v0, v0, v6

    aput-object v0, v8, v5

    aput-object v0, v8, v7

    goto :goto_1

    .line 752
    :cond_a
    array-length v8, v0

    if-ne v8, v6, :cond_b

    .line 753
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v8, v4

    aput-object v0, v8, v5

    aput-object v0, v8, v6

    aput-object v0, v8, v7

    .line 757
    :cond_b
    :goto_1
    const-string v0, "border-width"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_f

    add-int/lit8 v0, v0, 0xd

    .line 759
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 760
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 761
    array-length v8, v0

    if-ne v8, v1, :cond_c

    .line 762
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v7

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 763
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v6

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    .line 764
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v5

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    .line 765
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v4

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v8, Landroid/graphics/RectF;->left:F

    goto :goto_2

    .line 766
    :cond_c
    array-length v8, v0

    if-ne v8, v4, :cond_d

    .line 767
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v7

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 768
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v6

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    iput v9, v8, Landroid/graphics/RectF;->left:F

    .line 769
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v5

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v8, Landroid/graphics/RectF;->bottom:F

    goto :goto_2

    .line 770
    :cond_d
    array-length v8, v0

    if-ne v8, v5, :cond_e

    .line 771
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v9, v0, v7

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 772
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v6

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v8, Landroid/graphics/RectF;->right:F

    iput v0, v8, Landroid/graphics/RectF;->left:F

    goto :goto_2

    .line 773
    :cond_e
    array-length v8, v0

    if-ne v8, v6, :cond_f

    .line 774
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v8, Landroid/graphics/RectF;->right:F

    iput v0, v8, Landroid/graphics/RectF;->left:F

    iput v0, v8, Landroid/graphics/RectF;->bottom:F

    iput v0, v8, Landroid/graphics/RectF;->top:F

    .line 778
    :cond_f
    :goto_2
    const-string v0, "border-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_13

    add-int/lit8 v0, v0, 0xd

    .line 780
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 781
    invoke-direct {p0, v0}, Lcom/flyersoft/components/CSS$Style;->deleteBlanksInBrackets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 782
    array-length v8, v0

    if-ne v8, v1, :cond_10

    .line 783
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v8, v0, v4

    aput-object v8, v1, v7

    .line 784
    aget-object v8, v0, v7

    aput-object v8, v1, v6

    .line 785
    aget-object v8, v0, v6

    aput-object v8, v1, v5

    .line 786
    aget-object v0, v0, v5

    aput-object v0, v1, v4

    goto :goto_3

    .line 787
    :cond_10
    array-length v1, v0

    if-ne v1, v4, :cond_11

    .line 788
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v6

    .line 789
    aget-object v8, v0, v6

    aput-object v8, v1, v5

    aput-object v8, v1, v7

    .line 790
    aget-object v0, v0, v5

    aput-object v0, v1, v4

    goto :goto_3

    .line 791
    :cond_11
    array-length v1, v0

    if-ne v1, v5, :cond_12

    .line 792
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v4

    aput-object v8, v1, v6

    .line 793
    aget-object v0, v0, v6

    aput-object v0, v1, v5

    aput-object v0, v1, v7

    goto :goto_3

    .line 794
    :cond_12
    array-length v1, v0

    if-ne v1, v6, :cond_13

    .line 795
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v1, v4

    aput-object v0, v1, v6

    aput-object v0, v1, v5

    aput-object v0, v1, v7

    .line 799
    :cond_13
    :goto_3
    const-string v0, "border-left"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_18

    add-int/lit8 v0, v0, 0xc

    .line 801
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 802
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 803
    array-length v1, v0

    if-le v1, v5, :cond_14

    .line 804
    new-instance v1, Lcom/flyersoft/components/CSS$Style$Border;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/components/CSS$Style$Border;-><init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V

    .line 805
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    aget-object v9, v0, v9

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->left:F

    .line 806
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    aget-object v9, v0, v9

    aput-object v9, v8, v7

    .line 807
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget v1, v1, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    aget-object v0, v0, v1

    aput-object v0, v8, v7

    goto/16 :goto_4

    .line 808
    :cond_14
    array-length v1, v0

    if-le v1, v6, :cond_16

    .line 809
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 810
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v8

    iput v8, v1, Landroid/graphics/RectF;->left:F

    .line 811
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v7

    goto :goto_4

    .line 813
    :cond_15
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v7

    .line 814
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v7

    goto :goto_4

    .line 816
    :cond_16
    array-length v1, v0

    if-lez v1, :cond_1b

    .line 817
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 818
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->left:F

    goto :goto_4

    .line 820
    :cond_17
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v1, v7

    goto :goto_4

    .line 823
    :cond_18
    const-string v0, "border-left-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_19

    .line 824
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x12

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v7

    .line 825
    :cond_19
    const-string v0, "border-left-width"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_1a

    .line 826
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    add-int/lit8 v0, v0, 0x12

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->left:F

    .line 827
    :cond_1a
    const-string v0, "border-left-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_1b

    .line 828
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x12

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v7

    .line 831
    :cond_1b
    :goto_4
    const-string v0, "border-top"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_20

    add-int/lit8 v0, v0, 0xb

    .line 833
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 834
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 835
    array-length v1, v0

    if-le v1, v5, :cond_1c

    .line 836
    new-instance v1, Lcom/flyersoft/components/CSS$Style$Border;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/components/CSS$Style$Border;-><init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V

    .line 837
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    aget-object v9, v0, v9

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 838
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    aget-object v9, v0, v9

    aput-object v9, v8, v6

    .line 839
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget v1, v1, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    aget-object v0, v0, v1

    aput-object v0, v8, v6

    goto/16 :goto_5

    .line 840
    :cond_1c
    array-length v1, v0

    if-le v1, v6, :cond_1e

    .line 841
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 842
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v8

    iput v8, v1, Landroid/graphics/RectF;->top:F

    .line 843
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v6

    goto :goto_5

    .line 845
    :cond_1d
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v6

    .line 846
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v6

    goto :goto_5

    .line 848
    :cond_1e
    array-length v1, v0

    if-lez v1, :cond_23

    .line 849
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 850
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->top:F

    goto :goto_5

    .line 852
    :cond_1f
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v1, v6

    goto :goto_5

    .line 855
    :cond_20
    const-string v0, "border-top-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_21

    .line 856
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x11

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v6

    .line 857
    :cond_21
    const-string v0, "border-top-width"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_22

    .line 858
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    add-int/lit8 v0, v0, 0x11

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->top:F

    .line 859
    :cond_22
    const-string v0, "border-top-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_23

    .line 860
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x11

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v6

    .line 863
    :cond_23
    :goto_5
    const-string v0, "border-right"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_28

    add-int/lit8 v0, v0, 0xd

    .line 865
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 866
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 867
    array-length v1, v0

    if-le v1, v5, :cond_24

    .line 868
    new-instance v1, Lcom/flyersoft/components/CSS$Style$Border;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/components/CSS$Style$Border;-><init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V

    .line 869
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    aget-object v9, v0, v9

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    .line 870
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    aget-object v9, v0, v9

    aput-object v9, v8, v5

    .line 871
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget v1, v1, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    aget-object v0, v0, v1

    aput-object v0, v8, v5

    goto/16 :goto_6

    .line 872
    :cond_24
    array-length v1, v0

    if-le v1, v6, :cond_26

    .line 873
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 874
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v8

    iput v8, v1, Landroid/graphics/RectF;->right:F

    .line 875
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v5

    goto :goto_6

    .line 877
    :cond_25
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v5

    .line 878
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v5

    goto :goto_6

    .line 880
    :cond_26
    array-length v1, v0

    if-lez v1, :cond_2b

    .line 881
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 882
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->right:F

    goto :goto_6

    .line 884
    :cond_27
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v1, v5

    goto :goto_6

    .line 887
    :cond_28
    const-string v0, "border-right-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_29

    .line 888
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x13

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v5

    .line 889
    :cond_29
    const-string v0, "border-right-width"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_2a

    .line 890
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    add-int/lit8 v0, v0, 0x13

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->right:F

    .line 891
    :cond_2a
    const-string v0, "border-right-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_2b

    .line 892
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x13

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v5

    .line 895
    :cond_2b
    :goto_6
    const-string v0, "border-bottom"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_30

    add-int/lit8 v0, v0, 0xe

    .line 897
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 898
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 899
    array-length v1, v0

    if-le v1, v5, :cond_2c

    .line 900
    new-instance v1, Lcom/flyersoft/components/CSS$Style$Border;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/components/CSS$Style$Border;-><init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V

    .line 901
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    aget-object v9, v0, v9

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    .line 902
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget v9, v1, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    aget-object v9, v0, v9

    aput-object v9, v8, v4

    .line 903
    iget-object v8, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget v1, v1, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    aget-object v0, v0, v1

    aput-object v0, v8, v4

    goto/16 :goto_7

    .line 904
    :cond_2c
    array-length v1, v0

    if-le v1, v6, :cond_2e

    .line 905
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 906
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v8

    iput v8, v1, Landroid/graphics/RectF;->bottom:F

    .line 907
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v4

    goto :goto_7

    .line 909
    :cond_2d
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v8, v0, v7

    aput-object v8, v1, v4

    .line 910
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    aput-object v0, v1, v4

    goto :goto_7

    .line 912
    :cond_2e
    array-length v1, v0

    if-lez v1, :cond_33

    .line 913
    aget-object v1, v0, v7

    invoke-direct {p0, v1}, Lcom/flyersoft/components/CSS$Style;->isBorderSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 914
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->bottom:F

    goto :goto_7

    .line 916
    :cond_2f
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    aput-object v0, v1, v4

    goto :goto_7

    .line 919
    :cond_30
    const-string v0, "border-bottom-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_31

    .line 920
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x14

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    .line 921
    :cond_31
    const-string v0, "border-bottom-width"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_32

    .line 922
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    add-int/lit8 v0, v0, 0x14

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->bottom:F

    .line 923
    :cond_32
    const-string v0, "border-bottom-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_33

    .line 924
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x14

    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    .line 927
    :cond_33
    :goto_7
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v7

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "transparent"

    const/4 v8, 0x0

    if-eqz v0, :cond_34

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v7

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    :cond_34
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpl-float v0, v0, v8

    if-lez v0, :cond_35

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->left:F

    .line 928
    :cond_35
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v6

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v6

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    :cond_36
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v8

    if-lez v0, :cond_37

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->top:F

    .line 929
    :cond_37
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v5

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v5

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    :cond_38
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v8

    if-lez v0, :cond_39

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->right:F

    .line 930
    :cond_39
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v0, v0, v4

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->borderStyleOk(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v0, v0, v4

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    :cond_3a
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v8

    if-lez v0, :cond_3b

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->bottom:F

    .line 932
    :cond_3b
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    const/high16 v4, 0x41a00000    # 20.0f

    cmpl-float v0, v0, v4

    if-lez v0, :cond_3c

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->left:F

    .line 933
    :cond_3c
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_3d

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->top:F

    .line 934
    :cond_3d
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_3e

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->right:F

    .line 935
    :cond_3e
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_3f

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iput v8, v0, Landroid/graphics/RectF;->bottom:F

    .line 938
    :cond_3f
    const-string v0, "background"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_46

    add-int/lit8 v0, v0, 0xb

    .line 940
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    .line 941
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_46

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_46

    .line 942
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/CSS$Style;->deleteBlanksInBrackets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 943
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_46

    aget-object v4, v0, v2

    .line 944
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_44

    const-string v5, "rgb"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_40

    goto :goto_9

    .line 946
    :cond_40
    const-string v5, "url("

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 947
    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    goto :goto_a

    .line 948
    :cond_41
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v6, :cond_42

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_42

    .line 949
    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    goto :goto_a

    .line 950
    :cond_42
    const-string v5, "top"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_43

    const-string v5, "center"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_43

    const-string v5, "bottom"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 951
    :cond_43
    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    .line 952
    iget-object v4, p0, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    const-string v5, "left"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_45

    .line 953
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " left"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    goto :goto_a

    .line 945
    :cond_44
    :goto_9
    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    :cond_45
    :goto_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 958
    :cond_46
    const-string v0, "background-image"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_47

    add-int/lit8 v0, v0, 0x11

    .line 959
    invoke-static {p1, v0, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    .line 960
    :cond_47
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    if-eqz v0, :cond_48

    .line 961
    const-string v0, "background-position"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_48

    add-int/lit8 v0, v0, 0x14

    .line 962
    invoke-static {p1, v0, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    :cond_48
    return-void
.end method

.method private getMarginPaddingValue(Ljava/lang/String;)V
    .locals 12

    .line 555
    const-string v0, "margin"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    .line 557
    const-string v2, " +"

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, -0x1

    if-eq v0, v8, :cond_9

    add-int/lit8 v9, v0, 0x7

    .line 559
    invoke-static {p1, v9, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v9

    .line 560
    invoke-virtual {v9, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 561
    array-length v10, v9

    if-ne v10, v1, :cond_3

    .line 562
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v5

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->top:F

    .line 563
    aget-object v10, v9, v5

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->top:F

    .line 564
    :cond_0
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v6

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->right:F

    .line 565
    aget-object v10, v9, v6

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->right:F

    .line 566
    :cond_1
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v4

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->bottom:F

    .line 567
    aget-object v10, v9, v4

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->bottom:F

    .line 568
    :cond_2
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v3

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 569
    aget-object v9, v9, v3

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->left:F

    goto/16 :goto_0

    .line 570
    :cond_3
    array-length v10, v9

    if-ne v10, v3, :cond_6

    .line 571
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v5

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->top:F

    .line 572
    aget-object v10, v9, v5

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->top:F

    .line 573
    :cond_4
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v6

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->right:F

    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 574
    aget-object v10, v9, v6

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->right:F

    iput v7, v10, Landroid/graphics/RectF;->left:F

    .line 575
    :cond_5
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v4

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->bottom:F

    .line 576
    aget-object v9, v9, v4

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    .line 577
    :cond_6
    array-length v10, v9

    if-ne v10, v4, :cond_8

    .line 578
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v5

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->bottom:F

    iput v11, v10, Landroid/graphics/RectF;->top:F

    .line 579
    aget-object v10, v9, v5

    invoke-static {v10}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v10, Landroid/graphics/RectF;->bottom:F

    iput v7, v10, Landroid/graphics/RectF;->top:F

    .line 580
    :cond_7
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v6

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->right:F

    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 581
    aget-object v9, v9, v6

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->right:F

    iput v7, v9, Landroid/graphics/RectF;->left:F

    goto :goto_0

    .line 582
    :cond_8
    array-length v10, v9

    if-ne v10, v6, :cond_a

    .line 583
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    aget-object v11, v9, v5

    invoke-static {v11}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->right:F

    iput v11, v10, Landroid/graphics/RectF;->left:F

    iput v11, v10, Landroid/graphics/RectF;->bottom:F

    iput v11, v10, Landroid/graphics/RectF;->top:F

    .line 584
    aget-object v9, v9, v5

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->right:F

    iput v7, v9, Landroid/graphics/RectF;->left:F

    iput v7, v9, Landroid/graphics/RectF;->bottom:F

    iput v7, v9, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :cond_9
    const/4 v0, -0x1

    .line 589
    :cond_a
    :goto_0
    const-string v9, "margin-top"

    invoke-static {p1, v9}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-eq v9, v8, :cond_b

    if-ge v0, v9, :cond_b

    add-int/lit8 v9, v9, 0xb

    .line 591
    invoke-static {p1, v9, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v9

    .line 592
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->top:F

    .line 593
    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->top:F

    .line 595
    :cond_b
    const-string v9, "margin-bottom"

    invoke-static {p1, v9}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-eq v9, v8, :cond_c

    if-ge v0, v9, :cond_c

    add-int/lit8 v9, v9, 0xe

    .line 597
    invoke-static {p1, v9, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v9

    .line 598
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->bottom:F

    .line 599
    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_c

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->bottom:F

    .line 601
    :cond_c
    const-string v9, "margin-left"

    invoke-static {p1, v9}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-eq v9, v8, :cond_d

    if-ge v0, v9, :cond_d

    add-int/lit8 v9, v9, 0xc

    .line 603
    invoke-static {p1, v9, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v9

    .line 604
    iget-object v10, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v11

    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 605
    invoke-static {v9}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_d

    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v9, Landroid/graphics/RectF;->left:F

    .line 607
    :cond_d
    const-string v9, "margin-right"

    invoke-static {p1, v9}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-eq v9, v8, :cond_e

    if-ge v0, v9, :cond_e

    add-int/lit8 v9, v9, 0xd

    .line 609
    invoke-static {p1, v9, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 610
    iget-object v9, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v10

    iput v10, v9, Landroid/graphics/RectF;->right:F

    .line 611
    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iput v7, v0, Landroid/graphics/RectF;->right:F

    .line 615
    :cond_e
    const-string v0, "padding"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v8, :cond_18

    add-int/lit8 v9, v0, 0x8

    .line 619
    invoke-static {p1, v9, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v9

    .line 620
    invoke-virtual {v9, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 621
    array-length v9, v2

    if-ne v9, v1, :cond_12

    .line 622
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v9, v2, v5

    invoke-static {v9}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v9

    iput v9, v1, Landroid/graphics/RectF;->top:F

    .line 623
    aget-object v1, v2, v5

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 624
    :cond_f
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v5, v2, v6

    invoke-static {v5}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v5

    iput v5, v1, Landroid/graphics/RectF;->right:F

    .line 625
    aget-object v1, v2, v6

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->right:F

    .line 626
    :cond_10
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v5, v2, v4

    invoke-static {v5}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v5

    iput v5, v1, Landroid/graphics/RectF;->bottom:F

    .line 627
    aget-object v1, v2, v4

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->bottom:F

    .line 628
    :cond_11
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v4, v2, v3

    invoke-static {v4}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v4

    iput v4, v1, Landroid/graphics/RectF;->left:F

    .line 629
    aget-object v1, v2, v3

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->left:F

    goto/16 :goto_1

    .line 630
    :cond_12
    array-length v1, v2

    if-ne v1, v3, :cond_15

    .line 631
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v5

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 632
    aget-object v1, v2, v5

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 633
    :cond_13
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v6

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->right:F

    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 634
    aget-object v1, v2, v6

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->right:F

    iput v7, v1, Landroid/graphics/RectF;->left:F

    .line 635
    :cond_14
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v4

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->bottom:F

    .line 636
    aget-object v1, v2, v4

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->bottom:F

    goto :goto_1

    .line 637
    :cond_15
    array-length v1, v2

    if-ne v1, v4, :cond_17

    .line 638
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v5

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->bottom:F

    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 639
    aget-object v1, v2, v5

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->bottom:F

    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 640
    :cond_16
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v6

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->right:F

    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 641
    aget-object v1, v2, v6

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->right:F

    iput v7, v1, Landroid/graphics/RectF;->left:F

    goto :goto_1

    .line 642
    :cond_17
    array-length v1, v2

    if-ne v1, v6, :cond_19

    .line 643
    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    aget-object v3, v2, v5

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->right:F

    iput v3, v1, Landroid/graphics/RectF;->left:F

    iput v3, v1, Landroid/graphics/RectF;->bottom:F

    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 644
    aget-object v1, v2, v5

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->right:F

    iput v7, v1, Landroid/graphics/RectF;->left:F

    iput v7, v1, Landroid/graphics/RectF;->bottom:F

    iput v7, v1, Landroid/graphics/RectF;->top:F

    goto :goto_1

    :cond_18
    const/4 v0, -0x1

    .line 649
    :cond_19
    :goto_1
    const-string v1, "padding-top"

    invoke-static {p1, v1}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v8, :cond_1a

    if-ge v0, v1, :cond_1a

    add-int/lit8 v1, v1, 0xc

    .line 651
    invoke-static {p1, v1, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v1

    .line 652
    iget-object v2, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 653
    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 655
    :cond_1a
    const-string v1, "padding-bottom"

    invoke-static {p1, v1}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v8, :cond_1b

    if-ge v0, v1, :cond_1b

    add-int/lit8 v1, v1, 0xf

    .line 657
    invoke-static {p1, v1, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v1

    .line 658
    iget-object v2, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 659
    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->bottom:F

    .line 661
    :cond_1b
    const-string v1, "padding-left"

    invoke-static {p1, v1}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v8, :cond_1c

    if-ge v0, v1, :cond_1c

    add-int/lit8 v1, v1, 0xd

    .line 663
    invoke-static {p1, v1, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v1

    .line 664
    iget-object v2, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v3

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 665
    invoke-static {v1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, v1, Landroid/graphics/RectF;->left:F

    .line 667
    :cond_1c
    const-string v1, "padding-right"

    invoke-static {p1, v1}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v8, :cond_1d

    if-ge v0, v1, :cond_1d

    add-int/lit8 v1, v1, 0xe

    .line 669
    invoke-static {p1, v1, v6}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p1

    .line 670
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-static {p1}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 671
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1d

    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iput v7, p1, Landroid/graphics/RectF;->right:F

    .line 674
    :cond_1d
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->left:F

    const v0, -0x3b864000    # -999.0f

    const/4 v1, 0x0

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_1e

    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->left:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_1e

    .line 675
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iput v1, p1, Landroid/graphics/RectF;->left:F

    .line 676
    :cond_1e
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_1f

    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_1f

    .line 677
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iput v1, p1, Landroid/graphics/RectF;->top:F

    .line 678
    :cond_1f
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->right:F

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_20

    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->right:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_20

    .line 679
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iput v1, p1, Landroid/graphics/RectF;->right:F

    .line 680
    :cond_20
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_21

    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_21

    .line 681
    iget-object p1, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    :cond_21
    return-void
.end method

.method private get_emphasis_style(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1001
    const-string v0, "filled sesame"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1002
    const-string p1, "\ufe45"

    return-object p1

    .line 1003
    :cond_0
    const-string v0, "open sesame"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 1004
    const-string p1, "\ufe46"

    return-object p1

    .line 1005
    :cond_1
    const-string v0, "triangle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_2

    .line 1006
    const-string p1, "\u25b2"

    return-object p1

    .line 1007
    :cond_2
    const-string v0, "filled double-circle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_3

    .line 1008
    const-string p1, "\u25c9"

    return-object p1

    .line 1009
    :cond_3
    const-string v0, "double-circle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 1010
    const-string p1, "\u25ce"

    return-object p1

    .line 1011
    :cond_4
    const-string v0, "circle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_5

    .line 1012
    const-string p1, "\u25cf"

    return-object p1

    .line 1013
    :cond_5
    const-string v0, "dot"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-eq p1, v1, :cond_6

    .line 1014
    const-string p1, "\u2022"

    return-object p1

    :cond_6
    const/4 p1, 0x0

    return-object p1
.end method

.method private isBorderSize(Ljava/lang/String;)Z
    .locals 3

    .line 967
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 969
    :cond_0
    const-string v0, "thin"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    const-string v0, "medium"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "thick"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 971
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 v0, 0x2e

    if-eq p1, v0, :cond_3

    const/16 v0, 0x30

    if-lt p1, v0, :cond_2

    const/16 v0, 0x39

    if-gt p1, v0, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v2
.end method

.method private isCssColor(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 980
    :cond_0
    const-string v1, "currentcolor"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_3

    const-string v1, "transparent"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "hsl"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 982
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_2

    return v2

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v2
.end method

.method private mergeBorderStyle([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    const/4 v0, 0x4

    if-nez p1, :cond_1

    .line 337
    new-array p1, v0, [Ljava/lang/String;

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    .line 339
    aget-object v2, p2, v1

    if-eqz v2, :cond_2

    .line 340
    aput-object v2, p1, v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object p1
.end method

.method private mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 2

    .line 345
    iget v0, p2, Landroid/graphics/RectF;->left:F

    const v1, -0x3b864000    # -999.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget v0, p2, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 346
    :cond_0
    iget v0, p2, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    iget v0, p2, Landroid/graphics/RectF;->top:F

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 347
    :cond_1
    iget v0, p2, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    iget v0, p2, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 348
    :cond_2
    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    :cond_3
    return-void
.end method


# virtual methods
.method public combineStyle(Lcom/flyersoft/components/CSS$Style;)V
    .locals 4

    .line 275
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 276
    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->name:Ljava/lang/String;

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 278
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    goto :goto_1

    .line 279
    :cond_1
    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 281
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xc8

    const-string v3, "\n\n"

    if-ge v0, v2, :cond_2

    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    goto :goto_1

    .line 284
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x64

    if-ge v2, v3, :cond_3

    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    goto :goto_0

    :cond_3
    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    .line 287
    :cond_4
    :goto_1
    iget v0, p1, Lcom/flyersoft/components/CSS$Style;->align:I

    if-lez v0, :cond_5

    iput v0, p0, Lcom/flyersoft/components/CSS$Style;->align:I

    .line 288
    :cond_5
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->bold:Z

    if-nez v0, :cond_6

    iget-object v2, p1, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    if-eqz v2, :cond_7

    :cond_6
    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->bold:Z

    .line 290
    :cond_7
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->fontStyleNormal:Z

    if-eqz v0, :cond_8

    .line 291
    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->fontStyleNormal:Z

    .line 292
    iput-boolean v1, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    goto :goto_2

    .line 293
    :cond_8
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->italic:Z

    if-eqz v0, :cond_9

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    .line 295
    :cond_9
    :goto_2
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->underline:Z

    if-eqz v0, :cond_a

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->underline:Z

    .line 296
    :cond_a
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    if-eqz v0, :cond_b

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    .line 297
    :cond_b
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    .line 298
    :cond_c
    iget v0, p1, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    if-eqz v0, :cond_d

    iput v0, p0, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    .line 299
    :cond_d
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    if-eqz v0, :cond_e

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    .line 301
    :cond_e
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    if-eqz v0, :cond_f

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_3

    .line 302
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    if-nez v0, :cond_10

    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    if-eqz v0, :cond_10

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    .line 304
    :cond_10
    :goto_3
    iget v0, p1, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_11

    .line 305
    iput v0, p0, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    .line 306
    iget-boolean v0, p1, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    .line 308
    :cond_11
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    if-eqz v0, :cond_12

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    .line 309
    :cond_12
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    if-eqz v0, :cond_13

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    .line 310
    :cond_13
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    if-eqz v0, :cond_14

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    .line 311
    :cond_14
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    if-eqz v0, :cond_15

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    .line 312
    :cond_15
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->emphasis_style:Ljava/lang/String;

    if-eqz v0, :cond_16

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->emphasis_style:Ljava/lang/String;

    .line 313
    :cond_16
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    if-eqz v0, :cond_17

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    .line 314
    :cond_17
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    if-eqz v0, :cond_18

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;

    .line 315
    :cond_18
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    if-eqz v0, :cond_19

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    .line 316
    :cond_19
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    if-eqz v0, :cond_1a

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    .line 317
    :cond_1a
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    if-eqz v0, :cond_1b

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    .line 319
    :cond_1b
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->margin:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 320
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->marginInherited:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 321
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->padding:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 322
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->paddingInherited:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 323
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeMargins(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 325
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeBorderStyle([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    .line 326
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/CSS$Style;->mergeBorderStyle([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    .line 327
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    if-eqz v0, :cond_1c

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    .line 328
    :cond_1c
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    if-eqz v0, :cond_1d

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->background:Ljava/lang/String;

    .line 329
    :cond_1d
    iget-object v0, p1, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    if-eqz v0, :cond_1e

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    .line 330
    :cond_1e
    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    if-eqz p1, :cond_1f

    iput-object p1, p0, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    :cond_1f
    return-void
.end method

.method public scanPropertyForStyle(Ljava/lang/String;)V
    .locals 13

    .line 353
    :goto_0
    const-string v0, "//"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 354
    const-string v1, "\n"

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_30

    .line 363
    iget-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 364
    iput-object p1, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    goto :goto_1

    .line 366
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    .line 370
    :goto_1
    :try_start_0
    const-string v0, "\r"

    const-string v4, ""

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 371
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "none"

    const/4 v5, 0x1

    if-eqz v0, :cond_1

    :try_start_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->cssFontStyle:Z

    if-nez v0, :cond_9

    .line 372
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->bold:Z

    if-nez v0, :cond_2

    const-string v0, "bold"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_2

    .line 373
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->bold:Z

    .line 374
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    if-nez v0, :cond_3

    const-string v0, "italic"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_3

    .line 375
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    .line 376
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    if-nez v0, :cond_4

    const-string v0, "oblique"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_4

    .line 377
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    .line 378
    :cond_4
    iget-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->underline:Z

    if-nez v0, :cond_5

    const-string v0, "underline"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_5

    .line 379
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->underline:Z

    .line 380
    :cond_5
    iget-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    if-nez v0, :cond_6

    const-string v0, "line-through"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_6

    .line 381
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->strikethrough:Z

    .line 382
    :cond_6
    const-string v0, "text-shadow"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_7

    add-int/lit8 v0, v0, 0xc

    .line 384
    invoke-static {p1, v0, v2}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 385
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 386
    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->shadow:Ljava/lang/String;

    .line 388
    :cond_7
    const-string v0, "font-weight"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_8

    add-int/lit8 v0, v0, 0xc

    .line 390
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->fontWeight:Ljava/lang/String;

    .line 391
    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isFontWeightBold(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->bold:Z

    .line 393
    :cond_8
    const-string v0, "font-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_9

    add-int/lit8 v0, v0, 0xb

    .line 395
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    const-string v6, "normal"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 396
    iput-boolean v5, p0, Lcom/flyersoft/components/CSS$Style;->fontStyleNormal:Z

    .line 397
    iput-boolean v2, p0, Lcom/flyersoft/components/CSS$Style;->italic:Z

    .line 402
    :cond_9
    const-string v0, "text-align"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 403
    const-string v6, "left"

    const/4 v7, 0x2

    const/4 v8, 0x4

    const-string v9, "right"

    if-eq v0, v3, :cond_11

    add-int/lit8 v0, v0, 0xb

    .line 404
    :try_start_2
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 405
    sget-boolean v10, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v10, :cond_a

    sget-boolean v10, Lcom/flyersoft/tools/A;->cssAlignment:Z

    if-nez v10, :cond_f

    .line 406
    :cond_a
    const-string v10, "center"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    const/4 v10, 0x3

    .line 407
    iput v10, p0, Lcom/flyersoft/components/CSS$Style;->align:I

    goto :goto_3

    .line 408
    :cond_b
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_e

    const-string v10, "end"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    goto :goto_2

    .line 410
    :cond_c
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d

    const-string v10, "start"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 411
    :cond_d
    iput v5, p0, Lcom/flyersoft/components/CSS$Style;->align:I

    goto :goto_3

    .line 409
    :cond_e
    :goto_2
    iput v8, p0, Lcom/flyersoft/components/CSS$Style;->align:I

    .line 413
    :cond_f
    :goto_3
    sget-boolean v10, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v10, :cond_10

    sget-boolean v10, Lcom/flyersoft/tools/A;->cssJustify:Z

    if-nez v10, :cond_11

    :cond_10
    const-string v10, "justify"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 414
    iput v7, p0, Lcom/flyersoft/components/CSS$Style;->align:I

    .line 417
    :cond_11
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_12

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssIndent:Z

    if-nez v0, :cond_13

    .line 418
    :cond_12
    const-string v0, "text-indent"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_13

    add-int/lit8 v0, v0, 0xc

    .line 420
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getEmSize(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->indent:Ljava/lang/Float;

    .line 423
    :cond_13
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_14

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssFontColor:Z

    if-nez v0, :cond_17

    .line 424
    :cond_14
    const-string v0, "color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_15

    add-int/lit8 v0, v0, 0x6

    .line 426
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    .line 427
    :cond_15
    const-string v0, "-webkit-text-fill-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_16

    add-int/lit8 v0, v0, 0x18

    .line 429
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 430
    const-string v10, "transparent"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_16

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    if-eqz v10, :cond_16

    .line 431
    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->text_fill_color:Ljava/lang/String;

    .line 432
    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    .line 435
    :cond_16
    const-string v0, "background-color"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_17

    add-int/lit8 v0, v0, 0x11

    .line 437
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    .line 440
    :cond_17
    const-string v0, "display"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_18

    add-int/lit8 v0, v0, 0x8

    .line 442
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    .line 444
    :cond_18
    const-string v0, "visibility"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_19

    add-int/lit8 v0, v0, 0xb

    .line 446
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 447
    const-string v10, "hidden"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 448
    iput-object v4, p0, Lcom/flyersoft/components/CSS$Style;->display:Ljava/lang/String;

    .line 451
    :cond_19
    const-string v0, "text-emphasis-style"

    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;Z)I

    move-result v0

    if-eq v0, v3, :cond_1a

    add-int/lit8 v0, v0, 0x14

    .line 453
    invoke-static {p1, v0, v2}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/components/CSS$Style;->get_emphasis_style(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->emphasis_style:Ljava/lang/String;

    .line 455
    :cond_1a
    const-string v0, "list-style-type"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_1b

    add-int/lit8 v0, v0, 0x10

    .line 457
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    goto :goto_4

    .line 459
    :cond_1b
    const-string v0, "list-style"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_1c

    add-int/lit8 v0, v0, 0xb

    .line 461
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->ul_style:Ljava/lang/String;

    .line 464
    :cond_1c
    :goto_4
    const-string v0, "width"

    invoke-static {p1, v0, v2, v5}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;ZZ)I

    move-result v0

    if-eq v0, v3, :cond_1d

    add-int/lit8 v0, v0, 0x6

    .line 466
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->width:Ljava/lang/String;

    .line 468
    :cond_1d
    const-string v0, "max-width"

    invoke-static {p1, v0, v2, v5}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;ZZ)I

    move-result v0

    if-eq v0, v3, :cond_1e

    add-int/lit8 v0, v0, 0xa

    .line 470
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->maxWidth:Ljava/lang/String;

    .line 472
    :cond_1e
    const-string v0, "height"

    invoke-static {p1, v0, v2, v5}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;ZZ)I

    move-result v0

    if-eq v0, v3, :cond_1f

    add-int/lit8 v0, v0, 0x7

    .line 474
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->height:Ljava/lang/String;

    .line 479
    :cond_1f
    const-string v0, "font-family"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_24

    add-int/lit8 v0, v0, 0xc

    .line 481
    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->nextNotSplit(Ljava/lang/String;I)I

    move-result v0

    .line 482
    const-string v4, ";"

    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 483
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-eq v4, v3, :cond_20

    if-eq v1, v3, :cond_20

    if-ge v4, v1, :cond_22

    goto :goto_5

    :cond_20
    if-eq v4, v3, :cond_21

    goto :goto_5

    :cond_21
    if-eq v1, v3, :cond_23

    :cond_22
    move v4, v1

    goto :goto_5

    .line 484
    :cond_23
    invoke-static {p1, v0, v2}, Lcom/flyersoft/components/CSS;->nextSplit(Ljava/lang/String;IZ)I

    move-result v4

    :goto_5
    sub-int/2addr v0, v5

    .line 488
    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 489
    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 491
    iput-object v0, p0, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    .line 495
    :cond_24
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_25

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssFontSize:Z

    if-nez v0, :cond_29

    .line 496
    :cond_25
    const-string v0, "font-size"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_26

    add-int/lit8 v0, v0, 0xa

    .line 498
    invoke-static {p1, v0, v2}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 499
    invoke-static {v0, v5}, Lcom/flyersoft/components/CSS;->getCssSize(Ljava/lang/String;Z)F

    move-result v1

    iput v1, p0, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    .line 500
    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    goto :goto_7

    .line 502
    :cond_26
    const-string v0, "font"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_29

    add-int/lit8 v0, v0, 0x5

    .line 504
    invoke-static {p1, v0, v2}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 505
    const-string v1, " +"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    :goto_6
    if-ge v4, v8, :cond_29

    .line 506
    array-length v10, v1

    if-ge v4, v10, :cond_29

    .line 507
    aget-object v10, v1, v4

    .line 508
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-le v11, v7, :cond_28

    .line 509
    invoke-virtual {v10, v2}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2e

    if-eq v11, v12, :cond_27

    const/16 v12, 0x30

    if-lt v11, v12, :cond_28

    const/16 v12, 0x39

    if-gt v11, v12, :cond_28

    .line 511
    :cond_27
    invoke-static {v10, v5}, Lcom/flyersoft/components/CSS;->getCssSize(Ljava/lang/String;Z)F

    move-result v10

    const/4 v11, 0x0

    cmpl-float v11, v10, v11

    if-lez v11, :cond_28

    .line 513
    iput v10, p0, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    .line 514
    invoke-static {v0}, Lcom/flyersoft/components/CSS;->isInheritedSize(Ljava/lang/String;)Z

    move-result v10

    iput-boolean v10, p0, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    :cond_28
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 523
    :cond_29
    :goto_7
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_2a

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    if-nez v0, :cond_2c

    .line 524
    :cond_2a
    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS$Style;->getMarginPaddingValue(Ljava/lang/String;)V

    .line 525
    const-string v0, "page-break-after"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 526
    const-string v1, "always"

    if-eq v0, v3, :cond_2b

    add-int/lit8 v0, v0, 0x11

    :try_start_3
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 527
    iput v5, p0, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    .line 528
    :cond_2b
    const-string v0, "page-break-before"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_2c

    add-int/lit8 v0, v0, 0x12

    .line 529
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 530
    iput v3, p0, Lcom/flyersoft/components/CSS$Style;->pageBreak:I

    .line 533
    :cond_2c
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    if-eqz v0, :cond_2d

    sget-boolean v0, Lcom/flyersoft/tools/A;->cssOthers:Z

    if-nez v0, :cond_2f

    .line 534
    :cond_2d
    invoke-direct {p0, p1}, Lcom/flyersoft/components/CSS$Style;->getBorderAndBackground(Ljava/lang/String;)V

    .line 536
    const-string v0, "float"

    invoke-static {p1, v0}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_2f

    add-int/lit8 v0, v0, 0x6

    .line 538
    invoke-static {p1, v0, v5}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p1

    .line 539
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 540
    :cond_2e
    iput-object p1, p0, Lcom/flyersoft/components/CSS$Style;->floatSp:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 546
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2f
    return-void

    .line 356
    :cond_30
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v3, :cond_31

    .line 358
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    .line 360
    :cond_31
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0
.end method

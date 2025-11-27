.class public Lcom/ramotion/cardslider/DefaultViewUpdater;
.super Ljava/lang/Object;
.source "DefaultViewUpdater.java"

# interfaces
.implements Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;


# static fields
.field public static final SCALE_CENTER:F = 0.95f

.field public static final SCALE_CENTER_TO_LEFT:F = 0.3f

.field public static final SCALE_CENTER_TO_RIGHT:F = 0.14999998f

.field public static final SCALE_LEFT:F = 0.65f

.field public static final SCALE_RIGHT:F = 0.8f

.field public static final Z_CENTER_1:I = 0xc

.field public static final Z_CENTER_2:I = 0x10

.field public static final Z_RIGHT:I = 0x8


# instance fields
.field private activeCardCenter:I

.field private activeCardLeft:I

.field private activeCardRight:I

.field private cardWidth:I

.field private cardsGap:F

.field private lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

.field private previewView:Landroid/view/View;

.field private transitionDistance:I

.field private transitionEnd:I

.field private transitionRight2Center:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getLayoutManager()Lcom/ramotion/cardslider/CardSliderLayoutManager;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    return-object v0
.end method

.method public onLayoutManagerInitialized(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V
    .locals 6

    .line 38
    iput-object p1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    .line 40
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result v0

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->cardWidth:I

    .line 41
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardLeft()I

    move-result v0

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardLeft:I

    .line 42
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardRight()I

    move-result v0

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardRight:I

    .line 43
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardCenter()I

    move-result v0

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardCenter:I

    .line 44
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardsGap()F

    move-result p1

    iput p1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->cardsGap:F

    .line 46
    iget v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardCenter:I

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionEnd:I

    .line 47
    iget v1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardRight:I

    sub-int v0, v1, v0

    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionDistance:I

    .line 49
    iget v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->cardWidth:I

    int-to-float v2, v0

    int-to-float v3, v0

    const v4, 0x3f733333    # 0.95f

    mul-float v3, v3, v4

    sub-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    int-to-float v4, v0

    int-to-float v0, v0

    const v5, 0x3f4ccccd    # 0.8f

    mul-float v0, v0, v5

    sub-float/2addr v4, v0

    div-float/2addr v4, v3

    int-to-float v0, v1

    add-float/2addr v0, v2

    int-to-float v1, v1

    sub-float/2addr v1, v4

    sub-float/2addr v0, v1

    sub-float/2addr v0, p1

    .line 52
    iput v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionRight2Center:F

    return-void
.end method

.method public updateView(Landroid/view/View;F)V
    .locals 8

    const/high16 v0, 0x41400000    # 12.0f

    const/4 v1, 0x0

    cmpg-float v2, p2, v1

    if-gez v2, :cond_0

    .line 63
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p2, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p2

    int-to-float p2, p2

    iget v2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardLeft:I

    int-to-float v2, v2

    div-float/2addr p2, v2

    const v2, 0x3e99999a    # 0.3f

    mul-float v2, v2, p2

    const v3, 0x3f266666    # 0.65f

    add-float/2addr v2, v3

    const v3, 0x3dcccccd    # 0.1f

    add-float/2addr v3, p2

    mul-float v0, v0, p2

    goto/16 :goto_3

    :cond_0
    const/high16 v2, 0x3f000000    # 0.5f

    const v3, 0x3f733333    # 0.95f

    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v2, p2, v2

    if-gez v2, :cond_2

    const v2, 0x3f733333    # 0.95f

    :cond_1
    :goto_0
    const/high16 v3, 0x3f800000    # 1.0f

    goto/16 :goto_3

    :cond_2
    cmpg-float p2, p2, v4

    if-gez p2, :cond_4

    .line 74
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p2, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p2

    .line 75
    iget v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardCenter:I

    sub-int v1, p2, v0

    int-to-float v1, v1

    iget v2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardRight:I

    sub-int/2addr v2, v0

    int-to-float v0, v2

    div-float/2addr v1, v0

    const v0, 0x3e199998    # 0.14999998f

    mul-float v1, v1, v0

    sub-float v2, v3, v1

    .line 79
    iget v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionRight2Center:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionRight2Center:F

    iget v3, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionEnd:I

    sub-int v3, p2, v3

    int-to-float v3, v3

    mul-float v1, v1, v3

    iget v3, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionDistance:I

    int-to-float v3, v3

    div-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_3

    .line 80
    iget p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionRight2Center:F

    neg-float p2, p2

    move v1, p2

    goto :goto_1

    .line 82
    :cond_3
    iget v0, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionRight2Center:F

    neg-float v0, v0

    iget v1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionEnd:I

    sub-int/2addr p2, v1

    int-to-float p2, p2

    mul-float v0, v0, p2

    iget p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->transitionDistance:I

    int-to-float p2, p2

    div-float/2addr v0, p2

    move v1, v0

    :goto_1
    const/high16 v0, 0x41800000    # 16.0f

    goto :goto_0

    .line 89
    :cond_4
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->previewView:Landroid/view/View;

    const v2, 0x3f4ccccd    # 0.8f

    const/high16 v0, 0x41000000    # 8.0f

    if-eqz p2, :cond_1

    .line 94
    iget-object v5, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v5, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result p2

    iget v5, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->activeCardRight:I

    if-gt p2, v5, :cond_5

    goto :goto_2

    .line 100
    :cond_5
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->previewView:Landroid/view/View;

    invoke-static {p2}, Landroidx/core/view/ViewCompat;->getScaleX(Landroid/view/View;)F

    move-result v3

    .line 101
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    iget-object v1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->previewView:Landroid/view/View;

    invoke-virtual {p2, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v5

    .line 102
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->previewView:Landroid/view/View;

    invoke-static {p2}, Landroidx/core/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v1

    .line 105
    :goto_2
    iget p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->cardWidth:I

    int-to-float v6, p2

    int-to-float v7, p2

    mul-float v7, v7, v3

    sub-float/2addr v6, v7

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v6, v3

    int-to-float v7, p2

    int-to-float p2, p2

    mul-float p2, p2, v2

    sub-float/2addr v7, p2

    div-float/2addr v7, v3

    .line 107
    iget-object p2, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->lm:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p2, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p2

    int-to-float p2, p2

    add-float/2addr p2, v7

    int-to-float v3, v5

    sub-float/2addr v3, v6

    add-float/2addr v3, v1

    sub-float/2addr p2, v3

    .line 109
    iget v1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->cardsGap:F

    sub-float/2addr p2, v1

    neg-float v1, p2

    goto/16 :goto_0

    .line 116
    :goto_3
    invoke-static {p1, v2}, Landroidx/core/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 117
    invoke-static {p1, v2}, Landroidx/core/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 118
    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->setZ(Landroid/view/View;F)V

    .line 119
    invoke-static {p1, v1}, Landroidx/core/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 120
    invoke-static {p1, v3}, Landroidx/core/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 122
    iput-object p1, p0, Lcom/ramotion/cardslider/DefaultViewUpdater;->previewView:Landroid/view/View;

    return-void
.end method

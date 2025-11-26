.class public Lcom/github/mikephil/charting/data/BubbleEntry;
.super Lcom/github/mikephil/charting/data/Entry;
.source "BubbleEntry.java"


# instance fields
.field private mSize:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/Entry;-><init>(FF)V

    .line 29
    iput p3, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return-void
.end method

.method public constructor <init>(FFFLandroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p4}, Lcom/github/mikephil/charting/data/Entry;-><init>(FFLandroid/graphics/drawable/Drawable;)V

    .line 55
    iput p3, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return-void
.end method

.method public constructor <init>(FFFLandroid/graphics/drawable/Drawable;Ljava/lang/Object;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1, p2, p4, p5}, Lcom/github/mikephil/charting/data/Entry;-><init>(FFLandroid/graphics/drawable/Drawable;Ljava/lang/Object;)V

    .line 69
    iput p3, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return-void
.end method

.method public constructor <init>(FFFLjava/lang/Object;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p4}, Lcom/github/mikephil/charting/data/Entry;-><init>(FFLjava/lang/Object;)V

    .line 42
    iput p3, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return-void
.end method


# virtual methods
.method public copy()Lcom/github/mikephil/charting/data/BubbleEntry;
    .locals 5

    .line 74
    new-instance v0, Lcom/github/mikephil/charting/data/BubbleEntry;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BubbleEntry;->getX()F

    move-result v1

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BubbleEntry;->getY()F

    move-result v2

    iget v3, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BubbleEntry;->getData()Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/data/BubbleEntry;-><init>(FFFLjava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic copy()Lcom/github/mikephil/charting/data/Entry;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BubbleEntry;->copy()Lcom/github/mikephil/charting/data/BubbleEntry;

    move-result-object v0

    return-object v0
.end method

.method public getSize()F
    .locals 1

    .line 84
    iget v0, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return v0
.end method

.method public setSize(F)V
    .locals 0

    .line 88
    iput p1, p0, Lcom/github/mikephil/charting/data/BubbleEntry;->mSize:F

    return-void
.end method

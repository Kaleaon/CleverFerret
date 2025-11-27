.class public Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;
.super Lcom/github/mikephil/charting/formatter/ValueFormatter;
.source "IndexAxisValueFormatter.java"


# instance fields
.field private mValueCount:I

.field private mValues:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 17
    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/ValueFormatter;-><init>()V

    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    .line 11
    iput v0, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValueCount:I

    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/ValueFormatter;-><init>()V

    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    .line 11
    iput v0, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValueCount:I

    if-eqz p1, :cond_0

    .line 37
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->setValues([Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 2

    .line 25
    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/ValueFormatter;-><init>()V

    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    .line 11
    iput v0, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValueCount:I

    if-eqz p1, :cond_0

    .line 27
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->setValues([Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getFormattedValue(F)Ljava/lang/String;
    .locals 2

    .line 42
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-ltz v0, :cond_1

    .line 44
    iget v1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValueCount:I

    if-ge v0, v1, :cond_1

    float-to-int p1, p1

    if-eq v0, p1, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    iget-object p1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    aget-object p1, p1, v0

    return-object p1

    .line 45
    :cond_1
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    return-object v0
.end method

.method public setValues([Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 58
    new-array p1, p1, [Ljava/lang/String;

    .line 60
    :cond_0
    iput-object p1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValues:[Ljava/lang/String;

    .line 61
    array-length p1, p1

    iput p1, p0, Lcom/github/mikephil/charting/formatter/IndexAxisValueFormatter;->mValueCount:I

    return-void
.end method

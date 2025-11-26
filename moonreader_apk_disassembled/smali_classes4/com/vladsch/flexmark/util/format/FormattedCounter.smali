.class public Lcom/vladsch/flexmark/util/format/FormattedCounter;
.super Ljava/lang/Object;
.source "FormattedCounter.java"


# instance fields
.field private myCount:I

.field private final myDelimiter:Ljava/lang/String;

.field private final myFormat:Lcom/vladsch/flexmark/util/format/NumberFormat;

.field private final myLowercase:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/format/NumberFormat;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myFormat:Lcom/vladsch/flexmark/util/format/NumberFormat;

    .line 13
    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myLowercase:Ljava/lang/Boolean;

    .line 14
    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myDelimiter:Ljava/lang/String;

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/FormattedCounter;->reset()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 23
    iget v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myCount:I

    return v0
.end method

.method public getFormatted(Z)Ljava/lang/String;
    .locals 3

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myFormat:Lcom/vladsch/flexmark/util/format/NumberFormat;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myCount:I

    const/4 v2, 0x1

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/format/NumberFormat;->getFormat(Lcom/vladsch/flexmark/util/format/NumberFormat;I)Ljava/lang/String;

    move-result-object v0

    .line 32
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myLowercase:Ljava/lang/Boolean;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eqz p1, :cond_2

    .line 33
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myDelimiter:Ljava/lang/String;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myDelimiter:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v0
.end method

.method public nextCount()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myCount:I

    return v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/vladsch/flexmark/util/format/FormattedCounter;->myCount:I

    return-void
.end method

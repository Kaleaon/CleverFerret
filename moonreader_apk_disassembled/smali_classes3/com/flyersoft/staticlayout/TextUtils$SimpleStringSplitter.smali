.class public Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;
.super Ljava/lang/Object;
.source "TextUtils.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/TextUtils$StringSplitter;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/TextUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleStringSplitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/flyersoft/staticlayout/TextUtils$StringSplitter;",
        "Ljava/util/Iterator<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private mDelimiter:C

.field private mLength:I

.field private mPosition:I

.field private mString:Ljava/lang/String;


# direct methods
.method public constructor <init>(C)V
    .locals 0

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 355
    iput-char p1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mDelimiter:C

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 373
    iget v0, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mPosition:I

    iget v1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mLength:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 344
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 3

    .line 377
    iget-object v0, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mString:Ljava/lang/String;

    iget-char v1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mDelimiter:C

    iget v2, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mPosition:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 379
    iget v0, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mLength:I

    .line 381
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mString:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mPosition:I

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 382
    iput v0, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mPosition:I

    return-object v1
.end method

.method public remove()V
    .locals 1

    .line 387
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setString(Ljava/lang/String;)V
    .locals 1

    .line 363
    iput-object p1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mString:Ljava/lang/String;

    const/4 v0, 0x0

    .line 364
    iput v0, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mPosition:I

    .line 365
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/staticlayout/TextUtils$SimpleStringSplitter;->mLength:I

    return-void
.end method

.class Lorg/nibor/autolink/LinkExtractor$LinkIterator;
.super Ljava/lang/Object;
.source "LinkExtractor.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/nibor/autolink/LinkExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LinkIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lorg/nibor/autolink/LinkSpan;",
        ">;"
    }
.end annotation


# instance fields
.field private index:I

.field private final input:Ljava/lang/CharSequence;

.field private next:Lorg/nibor/autolink/LinkSpan;

.field private rewindIndex:I

.field final synthetic this$0:Lorg/nibor/autolink/LinkExtractor;


# direct methods
.method public constructor <init>(Lorg/nibor/autolink/LinkExtractor;Ljava/lang/CharSequence;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->this$0:Lorg/nibor/autolink/LinkExtractor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 106
    iput-object p1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    const/4 p1, 0x0

    .line 107
    iput p1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    .line 108
    iput p1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->rewindIndex:I

    .line 111
    iput-object p2, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->input:Ljava/lang/CharSequence;

    return-void
.end method

.method private setNext()V
    .locals 5

    .line 137
    iget-object v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    if-eqz v0, :cond_0

    goto :goto_1

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->input:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 142
    :goto_0
    iget v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    if-ge v1, v0, :cond_3

    .line 143
    iget-object v2, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->this$0:Lorg/nibor/autolink/LinkExtractor;

    iget-object v3, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->input:Ljava/lang/CharSequence;

    invoke-interface {v3, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-static {v2, v1}, Lorg/nibor/autolink/LinkExtractor;->access$200(Lorg/nibor/autolink/LinkExtractor;C)Lorg/nibor/autolink/internal/Scanner;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 145
    iget-object v2, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->input:Ljava/lang/CharSequence;

    iget v3, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    iget v4, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->rewindIndex:I

    invoke-interface {v1, v2, v3, v4}, Lorg/nibor/autolink/internal/Scanner;->scan(Ljava/lang/CharSequence;II)Lorg/nibor/autolink/LinkSpan;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 147
    iput-object v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    .line 148
    invoke-interface {v1}, Lorg/nibor/autolink/LinkSpan;->getEndIndex()I

    move-result v0

    iput v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    .line 149
    iput v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->rewindIndex:I

    return-void

    .line 152
    :cond_1
    iget v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    goto :goto_0

    .line 155
    :cond_2
    iget v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->index:I

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 116
    invoke-direct {p0}, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->setNext()V

    .line 117
    iget-object v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 102
    invoke-virtual {p0}, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next()Lorg/nibor/autolink/LinkSpan;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/nibor/autolink/LinkSpan;
    .locals 2

    .line 122
    invoke-virtual {p0}, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    const/4 v1, 0x0

    .line 124
    iput-object v1, p0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;->next:Lorg/nibor/autolink/LinkSpan;

    return-object v0

    .line 127
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 2

    .line 133
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "remove"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

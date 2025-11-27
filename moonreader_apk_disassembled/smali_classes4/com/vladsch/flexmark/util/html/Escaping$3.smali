.class final Lcom/vladsch/flexmark/util/html/Escaping$3;
.super Ljava/lang/Object;
.source "Escaping.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/Escaping$Replacer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/html/Escaping;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replace(Lcom/vladsch/flexmark/util/sequence/BasedSequence;IILcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V
    .locals 2

    .line 108
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p2, 0x1

    .line 109
    invoke-interface {p1, v0, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 111
    :cond_0
    invoke-interface {p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Html5Entities;->entityToSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2

    const/4 v0, 0x0

    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 100
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p2, p1, v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    return-void

    .line 102
    :cond_0
    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Html5Entities;->entityToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

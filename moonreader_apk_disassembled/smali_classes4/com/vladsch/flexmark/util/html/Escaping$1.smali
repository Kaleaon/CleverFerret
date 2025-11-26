.class final Lcom/vladsch/flexmark/util/html/Escaping$1;
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

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replace(Lcom/vladsch/flexmark/util/sequence/BasedSequence;IILcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V
    .locals 1

    .line 69
    invoke-interface {p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 70
    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    const-string p1, "&amp;"

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 72
    :cond_0
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    const-string p1, "&lt;"

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 74
    :cond_1
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 75
    const-string p1, "&gt;"

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 76
    :cond_2
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 77
    const-string p1, "&quot;"

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 79
    :cond_3
    invoke-virtual {p4, p2, p3}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 1

    .line 54
    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    const-string p1, "&amp;"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 56
    :cond_0
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    const-string p1, "&lt;"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 58
    :cond_1
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 59
    const-string p1, "&gt;"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 60
    :cond_2
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 61
    const-string p1, "&quot;"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 63
    :cond_3
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.class final Lcom/vladsch/flexmark/util/html/Escaping$5;
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

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replace(Lcom/vladsch/flexmark/util/sequence/BasedSequence;IILcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V
    .locals 0

    .line 136
    invoke-interface {p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Html5Entities;->entityToSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p4, p2, p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 131
    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Html5Entities;->entityToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

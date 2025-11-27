.class public interface abstract Lcom/vladsch/flexmark/util/options/OptionParser;
.super Ljava/lang/Object;
.source "OptionParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getOptionName()Ljava/lang/String;
.end method

.method public abstract getOptionText(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract parseOption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/Object;Lcom/vladsch/flexmark/util/options/MessageProvider;)Lcom/vladsch/flexmark/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "TT;",
            "Lcom/vladsch/flexmark/util/options/MessageProvider;",
            ")",
            "Lcom/vladsch/flexmark/util/Pair<",
            "TT;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParsedOption<",
            "TT;>;>;>;"
        }
    .end annotation
.end method

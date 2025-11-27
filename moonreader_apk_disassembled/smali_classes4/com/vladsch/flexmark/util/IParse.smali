.class public interface abstract Lcom/vladsch/flexmark/util/IParse;
.super Ljava/lang/Object;
.source "IParse.java"


# virtual methods
.method public abstract getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
.end method

.method public abstract parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract parse(Ljava/lang/String;)Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract parseReader(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract transferReferences(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Document;)Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract transferReferences(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Document;Ljava/lang/Boolean;)Z
.end method

.method public abstract withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/IParse;
.end method

.class public interface abstract Lorg/apache/commons/net/nntp/Threadable;
.super Ljava/lang/Object;
.source "Threadable.java"


# virtual methods
.method public abstract isDummy()Z
.end method

.method public abstract makeDummy()Lorg/apache/commons/net/nntp/Threadable;
.end method

.method public abstract messageThreadId()Ljava/lang/String;
.end method

.method public abstract messageThreadReferences()[Ljava/lang/String;
.end method

.method public abstract setChild(Lorg/apache/commons/net/nntp/Threadable;)V
.end method

.method public abstract setNext(Lorg/apache/commons/net/nntp/Threadable;)V
.end method

.method public abstract simplifiedSubject()Ljava/lang/String;
.end method

.method public abstract subjectIsReply()Z
.end method

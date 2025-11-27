.class public interface abstract annotation Lcom/facebook/infer/annotation/Nullsafe$TrustList;
.super Ljava/lang/Object;
.source "Nullsafe.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/facebook/infer/annotation/Nullsafe$TrustList;
        trustAll = false
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/infer/annotation/Nullsafe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "TrustList"
.end annotation


# virtual methods
.method public abstract trustAll()Z
.end method

.method public abstract value()[Ljava/lang/Class;
.end method

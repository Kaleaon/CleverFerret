.class public interface abstract Lcom/radaee/view/ILayoutView$IVPage;
.super Ljava/lang/Object;
.source "ILayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/ILayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IVPage"
.end annotation


# virtual methods
.method public abstract CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;
.end method

.method public abstract GetPageNo()I
.end method

.method public abstract GetVX(F)I
.end method

.method public abstract GetVY(F)I
.end method

.method public abstract ToDIBX(F)F
.end method

.method public abstract ToDIBY(F)F
.end method

.method public abstract ToPDFSize(F)F
.end method

.method public abstract ToPDFX(FF)F
.end method

.method public abstract ToPDFY(FF)F
.end method

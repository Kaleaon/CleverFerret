.class public interface abstract Lcom/radaee/pdf/Document$PDFJSDelegate;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFJSDelegate"
.end annotation


# virtual methods
.method public abstract OnAlert(ILjava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract OnConsole(ILjava/lang/String;)V
.end method

.method public abstract OnDocClose()Z
.end method

.method public abstract OnTmpFile()Ljava/lang/String;
.end method

.method public abstract OnUncaughtException(ILjava/lang/String;)V
.end method

.class public interface abstract Lcom/radaee/pdf/Document$PDFStream;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFStream"
.end annotation


# virtual methods
.method public abstract get_size()I
.end method

.method public abstract read([B)I
.end method

.method public abstract save(Ljava/io/OutputStream;)Z
.end method

.method public abstract seek(I)V
.end method

.method public abstract tell()I
.end method

.method public abstract write([B)I
.end method

.method public abstract writeable()Z
.end method

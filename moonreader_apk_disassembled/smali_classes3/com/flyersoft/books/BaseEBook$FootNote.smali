.class public Lcom/flyersoft/books/BaseEBook$FootNote;
.super Ljava/lang/Object;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/BaseEBook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FootNote"
.end annotation


# instance fields
.field public html:Ljava/lang/String;

.field public linkName:Ljava/lang/String;

.field public tag:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

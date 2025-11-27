.class Lcom/flyersoft/staticlayout/MyHtml$StyleMap;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyHtml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StyleMap"
.end annotation


# instance fields
.field basic:Z

.field section:Ljava/lang/String;

.field value:I


# direct methods
.method public constructor <init>(IZLjava/lang/String;)V
    .locals 0

    .line 510
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 511
    iput p1, p0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->value:I

    .line 512
    iput-boolean p2, p0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->basic:Z

    .line 513
    iput-object p3, p0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->section:Ljava/lang/String;

    return-void
.end method

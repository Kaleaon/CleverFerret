.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Font"
.end annotation


# instance fields
.field public fontSize_inherited:Z

.field public has_fill_color:Z

.field public mColor:Ljava/lang/String;

.field public mFace:Ljava/lang/String;

.field public mSize:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 0

    .line 3237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3238
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mColor:Ljava/lang/String;

    .line 3239
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mFace:Ljava/lang/String;

    .line 3240
    iput p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->mSize:F

    .line 3241
    iput-boolean p4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Font;->fontSize_inherited:Z

    return-void
.end method

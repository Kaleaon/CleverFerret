.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyBullet"
.end annotation


# instance fields
.field bullet:Ljava/lang/String;

.field style:Lcom/flyersoft/components/CSS$Style;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 0

    .line 3164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3165
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;->bullet:Ljava/lang/String;

    .line 3166
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$MyBullet;->style:Lcom/flyersoft/components/CSS$Style;

    return-void
.end method

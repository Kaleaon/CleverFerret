.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TableElement"
.end annotation


# instance fields
.field attr:Lorg/xml/sax/Attributes;

.field tag:Ljava/lang/String;

.field tdText:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;

.field type:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;Ljava/lang/String;Lorg/xml/sax/Attributes;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 2802
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->this$0:Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2803
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->tag:Ljava/lang/String;

    .line 2804
    iput-object p3, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->attr:Lorg/xml/sax/Attributes;

    .line 2805
    iput p4, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableElement;->type:I

    return-void
.end method

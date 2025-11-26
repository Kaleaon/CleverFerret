.class public Lcom/flyersoft/staticlayout/MRTextView;
.super Lcom/flyersoft/staticlayout/MyTextView;
.source "MRTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/MRTextView$MarginF;,
        Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;,
        Lcom/flyersoft/staticlayout/MRTextView$MRSpan;,
        Lcom/flyersoft/staticlayout/MRTextView$LineRecord;
    }
.end annotation


# static fields
.field static HYPH_RIGHT_PUNCS1:Ljava/lang/String; = "-,.;?\"\':)}]!\uff0c\u3002\uff1b\uff02\u201d\u201c\uff1a\uff1f\uff09\u3001\uff01\u2019\u2018\u00bb>"

.field static HYPH_RIGHT_PUNCS2:Ljava/lang/String; = "-,.!"

.field public static global_alignment:I

.field public static hasHindi:Z

.field static isPdf:Z

.field static isTxtContent:Z

.field static isTxtFile:Z

.field static mrSpanLines:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;",
            ">;"
        }
    .end annotation
.end field

.field public static noteBm:Landroid/graphics/Bitmap;

.field public static noteBm2:Landroid/graphics/Bitmap;

.field private static vertOld:Z


# instance fields
.field public appendLineCount:I

.field public disableDraw:Z

.field firstDrawLine:I

.field forceBoldLine:I

.field public forceHighlightKey:Ljava/lang/String;

.field private forceRedraw:Z

.field public hEnd:I

.field public hStart:I

.field public hasEmphasis:Z

.field public hasRuby:Z

.field private highlightLines:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public ignoreHighlight:Z

.field public indentWidth:F

.field italicAtBegin:Z

.field private italicIgnoreWidth:F

.field italicLine:I

.field italicLineEnd:I

.field public lastBorderTopLine:I

.field public lastChapter:I

.field public lastIgnoreLine:I

.field public lastSplitIndex:I

.field lastTxtChapterId:I

.field public layoutState:I

.field lineAligns:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field lineBrokens:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private lineHashPaints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/text/TextPaint;",
            ">;"
        }
    .end annotation
.end field

.field private lineHeight2:I

.field lineMargins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/staticlayout/MRTextView$MarginF;",
            ">;"
        }
    .end annotation
.end field

.field lineSpans:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field lineTextPureWidth:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private lineUnherited:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field lrCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/staticlayout/MRTextView$LineRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mBottom2:I

.field private mLineHeight:I

.field private mLineHeight2:I

.field public pageHighlightAlls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;"
        }
    .end annotation
.end field

.field preLine:I

.field preLt:Ljava/lang/String;

.field preTextPaint:Landroid/text/TextPaint;

.field preX:F

.field private pureText:Ljava/lang/String;

.field public rubyInited:Z

.field public scrollView:Landroid/view/View;

.field public selectedText:Ljava/lang/String;

.field private selfJustified:Z

.field tableIcon:Landroid/graphics/drawable/Drawable;

.field public txtSplitLine:I

.field public visualBookmarks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Bookmark;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 281
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    .line 610
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    .line 1483
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 1661
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    .line 1662
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    .line 2234
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    .line 2235
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    .line 2236
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    .line 2237
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    .line 2238
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    .line 2305
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    .line 2306
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    .line 58
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->initCurrentViewObjs()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 281
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    .line 610
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    .line 1483
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 1661
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    .line 1662
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    .line 2234
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    .line 2235
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    .line 2236
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    .line 2237
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    .line 2238
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    .line 2305
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    .line 2306
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    .line 47
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->initCurrentViewObjs()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 62
    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 281
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    .line 610
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    .line 1483
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 1661
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    .line 1662
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    .line 2234
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    .line 2235
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    .line 2236
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    .line 2237
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    .line 2238
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    .line 2305
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    .line 2306
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    .line 63
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->initCurrentViewObjs()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/ScrollView;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 281
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    .line 610
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    .line 1483
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 1661
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    .line 1662
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    .line 2234
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    .line 2235
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    .line 2236
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    .line 2237
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    .line 2238
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    .line 2305
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    .line 2306
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    .line 52
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->scrollView:Landroid/view/View;

    .line 53
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->initCurrentViewObjs()V

    return-void
.end method

.method private adjustItalicFinal(Ljava/lang/String;FFLjava/lang/String;Landroid/text/TextPaint;FZZ)F
    .locals 0

    const/4 p7, 0x0

    .line 318
    invoke-virtual {p1, p7}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->getType(C)I

    move-result p1

    if-nez p8, :cond_1

    const/4 p7, 0x5

    if-eq p1, p7, :cond_0

    const/16 p7, 0x14

    if-ge p1, p7, :cond_0

    goto :goto_0

    :cond_0
    const p1, 0x3ea8f5c3    # 0.33f

    goto :goto_1

    :cond_1
    :goto_0
    const p1, 0x3f28f5c3    # 0.66f

    :goto_1
    mul-float p3, p3, p1

    .line 324
    invoke-static {p4}, Lcom/flyersoft/tools/T;->trimEnd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p5}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result p1

    add-float/2addr p6, p1

    add-float/2addr p6, p3

    cmpg-float p1, p2, p6

    if-gez p1, :cond_2

    return p6

    :cond_2
    return p2
.end method

.method private adjustItalicLineX(IIIFI[Ljava/lang/Object;Ljava/lang/String;Landroid/text/TextPaint;)F
    .locals 13

    move/from16 v0, p3

    move-object/from16 v1, p8

    .line 287
    iget v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    const-string v3, " "

    if-ne v2, p1, :cond_1

    iget v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    if-ne v2, p2, :cond_1

    if-nez p5, :cond_1

    .line 288
    invoke-static {v3, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v7

    .line 293
    iget-boolean v12, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicAtBegin:Z

    if-eqz v12, :cond_0

    const v2, 0x3ecccccd    # 0.4f

    goto :goto_0

    :cond_0
    const v2, 0x3e4ccccd    # 0.2f

    :goto_0
    mul-float v2, v2, v7

    add-float v6, p4, v2

    .line 294
    iget v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    if-ne v2, p1, :cond_2

    iget-object v8, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLt:Ljava/lang/String;

    if-eqz v8, :cond_2

    .line 295
    iget-object v9, p0, Lcom/flyersoft/staticlayout/MRTextView;->preTextPaint:Landroid/text/TextPaint;

    iget v10, p0, Lcom/flyersoft/staticlayout/MRTextView;->preX:F

    const/4 v11, 0x1

    move-object v4, p0

    move-object/from16 v5, p7

    invoke-direct/range {v4 .. v12}, Lcom/flyersoft/staticlayout/MRTextView;->adjustItalicFinal(Ljava/lang/String;FFLjava/lang/String;Landroid/text/TextPaint;FZZ)F

    move-result v2

    move v6, v2

    goto :goto_1

    :cond_1
    move/from16 v6, p4

    :cond_2
    :goto_1
    const/4 v2, -0x1

    .line 298
    iput v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    iput v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    const/4 v2, 0x0

    .line 299
    iput-boolean v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicAtBegin:Z

    move-object/from16 v5, p6

    .line 300
    invoke-direct {p0, v5}, Lcom/flyersoft/staticlayout/MRTextView;->hasItalic([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v5

    const-class v7, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-interface {v5, p2, v0, v7}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/flyersoft/staticlayout/MRTextView;->hasItalic([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 301
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v5

    if-ne v5, p2, :cond_3

    const/4 v2, 0x1

    :cond_3
    iput-boolean v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicAtBegin:Z

    .line 302
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLine:I

    .line 303
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicLineEnd:I

    .line 304
    iget p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    if-ne p2, p1, :cond_4

    iget-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLt:Ljava/lang/String;

    if-eqz p2, :cond_4

    if-nez v2, :cond_4

    .line 305
    invoke-static {v3, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v7

    .line 306
    iget-object v8, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLt:Ljava/lang/String;

    iget-object v9, p0, Lcom/flyersoft/staticlayout/MRTextView;->preTextPaint:Landroid/text/TextPaint;

    iget v10, p0, Lcom/flyersoft/staticlayout/MRTextView;->preX:F

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v4, p0

    move-object/from16 v5, p7

    invoke-direct/range {v4 .. v12}, Lcom/flyersoft/staticlayout/MRTextView;->adjustItalicFinal(Ljava/lang/String;FFLjava/lang/String;Landroid/text/TextPaint;FZZ)F

    move-result v6

    .line 309
    :cond_4
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLine:I

    .line 310
    iput v6, p0, Lcom/flyersoft/staticlayout/MRTextView;->preX:F

    move-object/from16 v5, p7

    .line 311
    iput-object v5, p0, Lcom/flyersoft/staticlayout/MRTextView;->preLt:Ljava/lang/String;

    .line 312
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, v1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->preTextPaint:Landroid/text/TextPaint;

    return v6
.end method

.method private adjustSuperscriptSpanY(Landroid/text/Spanned;[Ljava/lang/Object;IIFLandroid/text/TextPaint;)F
    .locals 4

    .line 361
    const-class v0, Lcom/flyersoft/staticlayout/MySuperscriptSpan;

    invoke-static {p2, v0}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 362
    const-class p2, Lcom/flyersoft/staticlayout/MySuperscriptSpan;

    invoke-interface {p1, p3, p4, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/flyersoft/staticlayout/MySuperscriptSpan;

    .line 363
    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    aget-object v2, p2, v1

    .line 364
    invoke-interface {p1, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    if-ne v3, p3, :cond_2

    invoke-interface {p1, v2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    if-ne v2, p4, :cond_2

    .line 365
    new-instance p1, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {p1}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    .line 366
    invoke-virtual {p6, p1}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 367
    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int p1, p1

    int-to-float p2, p1

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    sub-float p2, p5, p2

    .line 369
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/View;->getScrollY()I

    move-result p3

    add-int/2addr p3, p1

    int-to-float p1, p3

    cmpg-float p3, p2, p1

    if-gez p3, :cond_0

    move p2, p1

    :cond_0
    cmpl-float p1, p2, p5

    if-lez p1, :cond_1

    goto :goto_1

    :cond_1
    return p2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return p5
.end method

.method private boldTxtChapter(Ljava/lang/String;Landroid/text/TextPaint;IZIZ)I
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    .line 613
    sget-boolean v3, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    const/4 v4, -0x1

    if-nez v3, :cond_0

    return v4

    .line 615
    :cond_0
    sget-object v3, Lcom/flyersoft/tools/A;->chapters:Ljava/util/ArrayList;

    if-eqz v3, :cond_16

    sget-object v3, Lcom/flyersoft/tools/A;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    goto/16 :goto_9

    .line 617
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 618
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    return v4

    .line 622
    :cond_2
    iget v5, v0, Lcom/flyersoft/staticlayout/MRTextView;->forceBoldLine:I

    const/4 v6, 0x1

    if-ne v2, v5, :cond_3

    goto/16 :goto_6

    :cond_3
    move/from16 v5, p5

    int-to-long v7, v5

    .line 625
    invoke-static {v7, v8}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v7

    .line 626
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 627
    iget v9, v0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    const-wide/16 v10, 0x1

    if-ltz v9, :cond_5

    if-ge v9, v5, :cond_5

    .line 630
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {v12, v9}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v12

    sub-long v14, v7, v10

    cmp-long v16, v12, v14

    if-ltz v16, :cond_5

    if-lt v9, v6, :cond_4

    .line 631
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v12

    add-int/lit8 v13, v9, -0x1

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {v12, v13}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v12

    cmp-long v14, v12, v7

    if-gez v14, :cond_5

    .line 632
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    goto :goto_0

    :cond_5
    const/4 v12, 0x0

    :goto_0
    const/4 v13, 0x0

    if-nez v12, :cond_6

    if-nez v9, :cond_6

    if-le v5, v6, :cond_6

    .line 633
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {v14, v6}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v14

    const-wide/16 v16, 0x64

    add-long v16, v7, v16

    cmp-long v18, v14, v16

    if-lez v18, :cond_6

    .line 634
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    :cond_6
    if-nez v12, :cond_c

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v5, :cond_c

    .line 638
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/flyersoft/tools/A$TxTChapter;

    move-wide/from16 v16, v10

    iget-wide v10, v15, Lcom/flyersoft/tools/A$TxTChapter;->position:J

    sub-long/2addr v10, v7

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    const-wide/16 v18, 0x7d0

    cmp-long v15, v10, v18

    if-gez v15, :cond_7

    const/4 v10, 0x1

    goto :goto_2

    :cond_7
    const/4 v10, 0x0

    .line 639
    :goto_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/tools/A$TxTChapter;

    move/from16 p1, v5

    iget-wide v4, v11, Lcom/flyersoft/tools/A$TxTChapter;->position:J

    cmp-long v11, v4, v7

    if-gez v11, :cond_a

    if-eqz v10, :cond_8

    .line 640
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {v4, v14}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v4

    cmp-long v10, v4, v7

    if-gez v10, :cond_a

    :cond_8
    add-int/lit8 v5, p1, -0x1

    if-ne v14, v5, :cond_9

    goto :goto_3

    :cond_9
    add-int/lit8 v14, v14, 0x1

    move/from16 v5, p1

    move-wide/from16 v10, v16

    const/4 v4, -0x1

    goto :goto_1

    .line 642
    :cond_a
    :goto_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    .line 643
    iput v14, v0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    add-int/lit8 v5, p1, -0x1

    if-ge v14, v5, :cond_b

    .line 645
    invoke-virtual {v12, v14}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v4

    sub-long v4, v7, v4

    cmp-long v9, v4, v16

    if-lez v9, :cond_b

    .line 646
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    add-int/lit8 v9, v14, 0x1

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {v4, v9}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v4

    cmp-long v10, v4, v7

    if-ltz v10, :cond_b

    .line 647
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    .line 648
    iput v9, v0, Lcom/flyersoft/staticlayout/MRTextView;->lastTxtChapterId:I

    goto :goto_4

    :cond_b
    move v9, v14

    :cond_c
    :goto_4
    if-eqz v12, :cond_e

    .line 654
    iget v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    if-lez v4, :cond_e

    .line 655
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    iget v5, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/A$TxTChapter;

    iget-wide v4, v4, Lcom/flyersoft/tools/A$TxTChapter;->displayPos:J

    const-wide/16 v10, -0x1

    cmp-long v13, v4, v10

    if-eqz v13, :cond_d

    .line 657
    sget-boolean v10, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v10, :cond_d

    iget-wide v10, v12, Lcom/flyersoft/tools/A$TxTChapter;->displayPos:J

    sub-long/2addr v10, v4

    const-wide/16 v16, 0x4b0

    cmp-long v14, v10, v16

    if-lez v14, :cond_d

    const/16 v10, 0x258

    goto :goto_5

    :cond_d
    const/16 v10, 0xc8

    :goto_5
    if-eqz v13, :cond_e

    sub-long/2addr v4, v7

    .line 659
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    int-to-long v10, v10

    cmp-long v13, v4, v10

    if-gez v13, :cond_e

    .line 660
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v4

    iget v5, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/flyersoft/tools/A$TxTChapter;

    .line 661
    iget v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    add-int/lit8 v9, v4, -0x1

    :cond_e
    if-eqz v12, :cond_15

    .line 665
    iget-object v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 666
    invoke-virtual {v12, v9}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide v4

    cmp-long v9, v4, v7

    if-nez v9, :cond_15

    iget-object v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    .line 667
    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_f

    iget-object v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_f

    iget-object v4, v12, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->trimChapterTitle1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    :cond_f
    :goto_6
    if-eqz p6, :cond_10

    goto :goto_8

    .line 673
    :cond_10
    sget-boolean v3, Lcom/flyersoft/tools/A;->fontBold:Z

    if-eqz v3, :cond_11

    const/high16 v3, 0x3f800000    # 1.0f

    .line 674
    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    const v6, -0x777778

    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    goto :goto_7

    .line 676
    :cond_11
    invoke-virtual {v1, v6}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 678
    :goto_7
    sget-boolean v1, Lcom/flyersoft/tools/A;->txtChapterSplit:Z

    if-eqz v1, :cond_13

    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v1, :cond_13

    sget-boolean v1, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v1, :cond_13

    sget-boolean v1, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v1, :cond_13

    .line 679
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDirection:I

    const/4 v15, -0x1

    if-ne v1, v15, :cond_12

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hasPageUpCache:Z

    if-eqz v1, :cond_13

    .line 680
    :cond_12
    iget v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    if-ne v1, v15, :cond_13

    iget v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->forceBoldLine:I

    if-ne v1, v15, :cond_13

    iget v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->firstDrawLine:I

    if-eq v1, v2, :cond_13

    if-lez v1, :cond_13

    .line 681
    iput v2, v0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    .line 682
    iput v2, v0, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    .line 683
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne v0, v1, :cond_13

    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_13

    .line 684
    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->invalidate()V

    :cond_13
    if-nez p4, :cond_14

    add-int/lit8 v1, v2, 0x1

    .line 688
    iput v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->forceBoldLine:I

    :cond_14
    :goto_8
    return v2

    :cond_15
    const/4 v15, -0x1

    return v15

    :cond_16
    :goto_9
    const/4 v15, -0x1

    return v15
.end method

.method private checkLineRecordDir(Lcom/flyersoft/staticlayout/MRTextView$LineRecord;I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;
    .locals 5

    .line 2133
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/MRTextView;->isRtf(I)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 2134
    iget-object p2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    array-length p2, p2

    .line 2135
    iget-object v0, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v2, v2, v1

    sub-float/2addr v0, v2

    .line 2136
    iget-object v2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    add-int/lit8 v3, p2, -0x1

    aget v2, v2, v3

    sub-float/2addr v2, v0

    .line 2137
    iget-object v3, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aput v2, v3, v1

    .line 2138
    iget-object v3, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    add-float/2addr v2, v0

    aput v2, v3, v1

    const/4 v0, 0x1

    :goto_0
    if-ge v0, p2, :cond_0

    .line 2140
    iget-object v1, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    aget v1, v1, v0

    iget-object v2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    .line 2141
    iget-object v2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    iget-object v3, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    sub-float/2addr v3, v1

    aput v3, v2, v0

    .line 2142
    iget-object v1, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    iget-object v2, p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v2, v2, v4

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static clearNoteBitmap()V
    .locals 1

    .line 1965
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 1966
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm2:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    const/4 v0, 0x0

    .line 1967
    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm2:Landroid/graphics/Bitmap;

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    return-void
.end method

.method private createHighlightAllItems(II)V
    .locals 31

    move-object/from16 v1, p0

    .line 1591
    sget-object v0, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceHighlightKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1658
    :cond_0
    iput-object v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->pageHighlightAlls:Ljava/util/ArrayList;

    return-void

    :cond_1
    :goto_0
    const/4 v0, 0x0

    if-gez p1, :cond_2

    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    move/from16 v3, p1

    .line 1594
    :goto_1
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    move/from16 v6, p2

    if-le v6, v4, :cond_3

    .line 1595
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v4

    sub-int/2addr v4, v5

    goto :goto_2

    :cond_3
    move v4, v6

    .line 1596
    :goto_2
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v3

    .line 1597
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v4

    .line 1599
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v1, Lcom/flyersoft/staticlayout/MRTextView;->pageHighlightAlls:Ljava/util/ArrayList;

    .line 1600
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v6

    .line 1602
    sget-object v7, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 1603
    iget-object v8, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceHighlightKey:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4

    add-int/lit8 v7, v7, 0x1

    :cond_4
    const/4 v8, 0x0

    :goto_3
    if-ge v8, v7, :cond_14

    .line 1607
    :try_start_0
    sget-object v9, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ne v8, v9, :cond_5

    const/4 v9, 0x1

    goto :goto_4

    :cond_5
    const/4 v9, 0x0

    :goto_4
    if-eqz v9, :cond_6

    .line 1608
    iget-object v10, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceHighlightKey:Ljava/lang/String;

    goto :goto_5

    :cond_6
    sget-object v10, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v10, v10, Lcom/flyersoft/tools/A$HighlightAll;->key:Ljava/lang/String;

    :goto_5
    if-eqz v9, :cond_7

    .line 1612
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 1613
    sget v12, Lcom/flyersoft/tools/A;->highlight_color:I

    const/16 v13, -0x78

    invoke-static {v12, v13}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    goto :goto_6

    :cond_7
    move-object v11, v2

    move-object v12, v11

    :goto_6
    move v13, v3

    .line 1618
    :goto_7
    invoke-virtual {v6, v10, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_13

    if-lt v13, v4, :cond_8

    goto/16 :goto_e

    :cond_8
    const/4 v14, 0x2

    if-nez v9, :cond_a

    if-nez v11, :cond_a

    .line 1623
    sget-object v11, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v11, v11, Lcom/flyersoft/tools/A$HighlightAll;->style:Ljava/lang/String;

    .line 1624
    invoke-virtual {v11, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    .line 1625
    invoke-virtual {v11, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    .line 1626
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    sget v15, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v15}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v15

    if-eqz v15, :cond_9

    const/16 v15, -0x32

    goto :goto_8

    :cond_9
    const/16 v15, -0x64

    :goto_8
    invoke-static {v11, v15}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    move-object/from16 v30, v11

    move-object/from16 v29, v12

    goto :goto_9

    :cond_a
    move-object/from16 v29, v11

    move-object/from16 v30, v12

    .line 1628
    :goto_9
    new-instance v11, Lcom/flyersoft/tools/BookDb$NoteInfo;

    const-string v12, ""

    const-string v15, ""

    move/from16 p1, v3

    int-to-long v2, v13

    .line 1629
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v19

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const-string v23, ""

    const-string v24, ""

    .line 1630
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v5, :cond_b

    const/16 v26, 0x1

    goto :goto_a

    :cond_b
    const/16 v26, 0x0

    .line 1631
    :goto_a
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v14, :cond_c

    const/16 v27, 0x1

    goto :goto_b

    :cond_c
    const/16 v27, 0x0

    :goto_b
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v14, 0x3

    if-ne v0, v14, :cond_d

    const-string v0, "1"

    goto :goto_c

    :cond_d
    const-string v0, ""

    :goto_c
    move-object/from16 v28, v0

    move v0, v13

    move-object v13, v12

    const/4 v12, 0x0

    move-object v14, v15

    const/4 v15, 0x0

    const/16 v16, 0x0

    const-wide/16 v21, 0x0

    move-wide/from16 v17, v2

    move-object/from16 v25, v10

    invoke-direct/range {v11 .. v28}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 1632
    iput-boolean v5, v11, Lcom/flyersoft/tools/BookDb$NoteInfo;->checkRealPosition:Z

    if-nez v9, :cond_11

    .line 1635
    sget-object v2, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$HighlightAll;

    iget-boolean v2, v2, Lcom/flyersoft/tools/A$HighlightAll;->relatedNoteChecked:Z

    if-nez v2, :cond_f

    .line 1636
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1637
    iget-object v12, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    .line 1638
    sget-object v12, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/A$HighlightAll;

    iput-object v3, v12, Lcom/flyersoft/tools/A$HighlightAll;->relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    goto :goto_d

    .line 1639
    :cond_f
    sget-object v2, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$HighlightAll;

    iput-boolean v5, v2, Lcom/flyersoft/tools/A$HighlightAll;->relatedNoteChecked:Z

    .line 1640
    sget-object v2, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v2, v2, Lcom/flyersoft/tools/A$HighlightAll;->relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v2, :cond_10

    .line 1641
    sget-object v2, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v2, v2, Lcom/flyersoft/tools/A$HighlightAll;->relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iput-object v2, v11, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1642
    sget-object v2, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v2, v2, Lcom/flyersoft/tools/A$HighlightAll;->relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object v2, v11, Lcom/flyersoft/tools/BookDb$NoteInfo;->relatedNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1644
    :cond_10
    iput-boolean v5, v11, Lcom/flyersoft/tools/BookDb$NoteInfo;->isHighlightAllItem:Z

    .line 1647
    :cond_11
    iget-object v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->pageHighlightAlls:Ljava/util/ArrayList;

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1648
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    add-int v13, v0, v2

    .line 1649
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v13, v0, :cond_12

    goto :goto_f

    :cond_12
    move/from16 v3, p1

    move-object/from16 v11, v29

    move-object/from16 v12, v30

    const/4 v0, 0x0

    const/4 v2, 0x0

    goto/16 :goto_7

    :cond_13
    :goto_e
    move/from16 p1, v3

    :goto_f
    add-int/lit8 v8, v8, 0x1

    move/from16 v3, p1

    const/4 v0, 0x0

    const/4 v2, 0x0

    goto/16 :goto_3

    :catch_0
    move-exception v0

    .line 1655
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_14
    return-void
.end method

.method private drawAllHighlight(Landroid/graphics/Canvas;)V
    .locals 28

    move-object/from16 v1, p0

    .line 1494
    iget-boolean v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->ignoreHighlight:Z

    if-eqz v0, :cond_0

    goto/16 :goto_f

    .line 1496
    :cond_0
    iget-object v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 1497
    iget-object v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1498
    iget-object v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v9, 0x0

    .line 1502
    :try_start_0
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    .line 1503
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v10

    .line 1504
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getTxtHeight()I

    move-result v3

    add-int/2addr v0, v3

    invoke-virtual {v2, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v0

    add-int/lit8 v2, v10, -0x1

    add-int/lit8 v3, v0, 0x1

    .line 1505
    invoke-direct {v1, v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->createHighlightAllItems(II)V

    move v3, v10

    :goto_0
    if-gt v3, v0, :cond_17

    const/4 v2, 0x0

    .line 1508
    invoke-virtual {v1, v3, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineBounds(ILandroid/graphics/Rect;)I

    move-result v11

    .line 1509
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v12

    .line 1510
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v13

    .line 1514
    sget-boolean v2, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z

    const/4 v14, -0x1

    const/4 v15, 0x1

    if-eqz v2, :cond_3

    if-lez v10, :cond_2

    .line 1515
    sget-boolean v2, Lcom/flyersoft/tools/A;->txtChapterSplit:Z

    if-eqz v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v2, :cond_2

    .line 1516
    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    if-ne v2, v14, :cond_1

    .line 1517
    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLineText(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v6

    const/4 v7, 0x1

    move v4, v3

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->boldTxtChapter(Ljava/lang/String;Landroid/text/TextPaint;IZIZ)I

    move-result v2

    move v3, v4

    iput v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    .line 1518
    :cond_1
    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    if-eq v2, v14, :cond_2

    if-eq v2, v10, :cond_2

    if-lt v3, v2, :cond_2

    move/from16 v20, v0

    move/from16 v24, v8

    move/from16 v21, v10

    goto/16 :goto_c

    :cond_2
    int-to-long v4, v12

    .line 1521
    invoke-static {v4, v5}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v2, v4, v6

    move-wide/from16 v17, v4

    if-nez v2, :cond_4

    const/4 v2, 0x1

    goto :goto_1

    :cond_3
    const-wide/16 v4, 0x0

    move-wide/from16 v17, v4

    :cond_4
    const/4 v2, 0x0

    :goto_1
    if-nez v2, :cond_d

    .line 1526
    sget-object v2, Lcom/flyersoft/tools/A;->notes:Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    if-eqz v2, :cond_9

    .line 1527
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_9

    .line 1528
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_2
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1529
    sget-boolean v4, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v4, :cond_5

    .line 1530
    :try_start_2
    iget-wide v4, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    sub-long v4, v4, v17

    int-to-long v6, v12

    add-long/2addr v4, v6

    long-to-int v5, v4

    move v4, v8

    int-to-long v7, v5

    .line 1531
    :try_start_3
    iget v6, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    add-int/2addr v5, v6

    int-to-long v5, v5

    move/from16 v16, v4

    move v4, v11

    :try_start_4
    iget v11, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    move-wide/from16 v26, v5

    move v6, v10

    move-wide/from16 v9, v26

    move v5, v12

    const/16 v20, 0x0

    iget-boolean v12, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    move/from16 v21, v6

    move v6, v13

    iget-boolean v13, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    const/16 v22, -0x1

    iget-boolean v14, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move/from16 v23, v16

    const/16 v16, 0x0

    move/from16 v20, v0

    move-object v15, v2

    move/from16 v24, v23

    const/4 v0, -0x1

    move-object/from16 v2, p1

    :try_start_5
    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    goto :goto_3

    :catchall_0
    move-exception v0

    move/from16 v24, v16

    goto/16 :goto_d

    :catchall_1
    move-exception v0

    move/from16 v24, v4

    goto/16 :goto_d

    :cond_5
    move/from16 v20, v0

    move-object v15, v2

    move/from16 v24, v8

    move/from16 v21, v10

    move v4, v11

    move v5, v12

    move v6, v13

    const/4 v0, -0x1

    .line 1534
    :try_start_6
    sget-boolean v2, Lcom/flyersoft/staticlayout/MRTextView;->isPdf:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v2, :cond_6

    :try_start_7
    iget v2, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-ne v2, v0, :cond_6

    iget v2, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    int-to-long v7, v2

    sget-wide v9, Lcom/flyersoft/tools/A;->lastPosition:J
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    cmp-long v2, v7, v9

    if-eqz v2, :cond_7

    :cond_6
    :try_start_8
    sget-boolean v2, Lcom/flyersoft/staticlayout/MRTextView;->isPdf:Z

    if-nez v2, :cond_8

    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->lastChapter:I

    iget v7, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-ne v2, v7, :cond_8

    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->lastSplitIndex:I

    iget v7, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-ne v2, v7, :cond_8

    .line 1536
    :cond_7
    iget-wide v7, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v9, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget v2, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    int-to-long v11, v2

    add-long/2addr v9, v11

    iget v11, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    iget-boolean v12, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    iget-boolean v13, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    iget-boolean v14, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    const/16 v16, 0x0

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V

    :cond_8
    :goto_3
    move-object/from16 v1, p0

    move v11, v4

    move v12, v5

    move v13, v6

    move/from16 v0, v20

    move/from16 v10, v21

    move/from16 v8, v24

    const/4 v9, 0x0

    const/4 v14, -0x1

    const/4 v15, 0x1

    goto/16 :goto_2

    :catchall_2
    move-exception v0

    move/from16 v24, v8

    goto/16 :goto_6

    :cond_9
    move/from16 v20, v0

    move/from16 v24, v8

    move/from16 v21, v10

    move v4, v11

    move v5, v12

    move v6, v13

    const/4 v0, -0x1

    .line 1543
    sget-object v1, Lcom/flyersoft/tools/A;->bookmarkList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 1544
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_a
    :goto_4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/A$Bookmark;

    .line 1545
    sget-boolean v2, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z

    if-eqz v2, :cond_b

    .line 1546
    iget-wide v7, v1, Lcom/flyersoft/tools/A$Bookmark;->position:J
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    sub-long v7, v7, v17

    int-to-long v9, v5

    add-long/2addr v7, v9

    long-to-int v2, v7

    int-to-long v7, v2

    const/16 v25, 0x1

    add-int/lit8 v2, v2, 0x1

    int-to-long v9, v2

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v2, p1

    move-object/from16 v16, v1

    move-object/from16 v1, p0

    .line 1547
    :try_start_9
    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_4

    :cond_b
    move-object v2, v1

    move-object/from16 v1, p0

    .line 1549
    sget-boolean v7, Lcom/flyersoft/staticlayout/MRTextView;->isPdf:Z

    if-nez v7, :cond_a

    iget v7, v1, Lcom/flyersoft/staticlayout/MRTextView;->lastChapter:I

    iget v8, v2, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    if-ne v7, v8, :cond_a

    iget v7, v1, Lcom/flyersoft/staticlayout/MRTextView;->lastSplitIndex:I

    iget v8, v2, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    if-ne v7, v8, :cond_a

    .line 1550
    iget-wide v7, v2, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget-wide v9, v2, Lcom/flyersoft/tools/A$Bookmark;->position:J

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v16, v2

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_4

    :cond_c
    move-object/from16 v1, p0

    .line 1554
    iget-object v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->pageHighlightAlls:Ljava/util/ArrayList;

    if-eqz v2, :cond_e

    .line 1555
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1556
    iget-wide v7, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v9, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget v2, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    int-to-long v11, v2

    add-long/2addr v9, v11

    iget v11, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    iget-boolean v12, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    iget-boolean v13, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    iget-boolean v14, v15, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    const/16 v16, 0x0

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_5

    :catchall_3
    move-exception v0

    :goto_6
    move-object/from16 v1, p0

    goto/16 :goto_d

    :cond_d
    move/from16 v20, v0

    move/from16 v24, v8

    move/from16 v21, v10

    move v4, v11

    move v5, v12

    move v6, v13

    const/4 v0, -0x1

    .line 1562
    :cond_e
    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    if-eq v2, v0, :cond_16

    iget v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    if-le v0, v2, :cond_16

    .line 1563
    sget-boolean v0, Lcom/flyersoft/tools/A;->highlightStyleAsSelec:Z

    if-eqz v0, :cond_15

    .line 1564
    iget v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    int-to-long v7, v0

    iget v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    int-to-long v9, v0

    .line 1565
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    const/4 v2, 0x2

    const/4 v11, 0x3

    if-ne v0, v11, :cond_f

    sget v0, Lcom/flyersoft/tools/A;->squiggly_color:I

    :goto_7
    const/4 v12, 0x1

    goto :goto_8

    :cond_f
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    if-ne v0, v2, :cond_10

    sget v0, Lcom/flyersoft/tools/A;->strikethrough_color:I

    goto :goto_7

    :cond_10
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    const/4 v12, 0x1

    if-ne v0, v12, :cond_11

    sget v0, Lcom/flyersoft/tools/A;->underline_color:I

    goto :goto_8

    :cond_11
    sget v0, Lcom/flyersoft/tools/A;->highlight_color:I

    :goto_8
    sget v13, Lcom/flyersoft/tools/A;->highlightMode:I

    if-ne v13, v12, :cond_12

    goto :goto_9

    :cond_12
    const/4 v12, 0x0

    :goto_9
    const/16 v25, 0x1

    sget v13, Lcom/flyersoft/tools/A;->highlightMode:I

    if-ne v13, v2, :cond_13

    const/4 v13, 0x1

    goto :goto_a

    :cond_13
    const/4 v13, 0x0

    :goto_a
    sget v2, Lcom/flyersoft/tools/A;->highlightMode:I

    if-ne v2, v11, :cond_14

    const/4 v14, 0x1

    goto :goto_b

    :cond_14
    const/4 v14, 0x0

    :goto_b
    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v2, p1

    move v11, v0

    .line 1564
    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_c

    .line 1568
    :cond_15
    iget v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    int-to-long v7, v0

    iget v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    int-to-long v9, v0

    sget v11, Lcom/flyersoft/tools/A;->highlight_color:I

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v16}, Lcom/flyersoft/staticlayout/MRTextView;->drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :cond_16
    :goto_c
    add-int/lit8 v3, v3, 0x1

    move/from16 v0, v20

    move/from16 v10, v21

    move/from16 v8, v24

    const/4 v9, 0x0

    goto/16 :goto_0

    :catchall_4
    move-exception v0

    goto :goto_d

    :cond_17
    move/from16 v24, v8

    const/4 v2, 0x0

    goto :goto_e

    :catchall_5
    move-exception v0

    move/from16 v24, v8

    .line 1575
    :goto_d
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    .line 1576
    iput-boolean v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceRedraw:Z

    .line 1579
    :goto_e
    iget-boolean v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceRedraw:Z

    if-eqz v0, :cond_18

    .line 1580
    iput-boolean v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->forceRedraw:Z

    .line 1581
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->drawAllHighlight(Landroid/graphics/Canvas;)V

    .line 1584
    :cond_18
    iget-object v0, v1, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move/from16 v4, v24

    if-eq v4, v0, :cond_19

    .line 1585
    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    :cond_19
    :goto_f
    return-void
.end method

.method private drawBackgroundColorSpan(Landroid/graphics/Canvas;IIFFLandroid/text/Spanned;ILcom/flyersoft/components/CSS$BackgroundColorSpan;)V
    .locals 1

    .line 798
    invoke-interface {p6, p8}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result p4

    .line 799
    invoke-interface {p6, p8}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result p6

    if-ge p4, p2, :cond_0

    move p4, p2

    :cond_0
    if-le p6, p3, :cond_1

    move p6, p3

    :cond_1
    if-ne p4, p6, :cond_2

    return-void

    .line 808
    :cond_2
    invoke-virtual {p0, p7, p4}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result p4

    .line 809
    invoke-virtual {p0, p7, p6}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result p6

    .line 813
    invoke-direct {p0, p2, p3}, Lcom/flyersoft/staticlayout/MRTextView;->getTextRealHeight(II)I

    move-result p2

    .line 814
    div-int/lit8 p3, p2, 0x4

    add-int/lit8 p3, p3, 0x1

    int-to-float p2, p2

    sub-float p2, p5, p2

    int-to-float p3, p3

    add-float/2addr p2, p3

    add-float/2addr p5, p3

    .line 818
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 819
    iget v0, p8, Lcom/flyersoft/components/CSS$BackgroundColorSpan;->color:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 p7, -0x78

    goto :goto_0

    .line 820
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p7

    invoke-virtual {v0, p7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p7

    if-eqz p7, :cond_4

    const/16 p7, -0x64

    goto :goto_0

    :cond_4
    const/4 p7, 0x0

    .line 821
    :goto_0
    iget p8, p8, Lcom/flyersoft/components/CSS$BackgroundColorSpan;->color:I

    invoke-static {p8, p7}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result p7

    invoke-virtual {p3, p7}, Landroid/graphics/Paint;->setColor(I)V

    .line 823
    new-instance p7, Landroid/graphics/RectF;

    invoke-direct {p7, p4, p2, p6, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 824
    invoke-virtual {p1, p7, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawBackgroundColorSpans(Landroid/graphics/Canvas;IIFFLandroid/text/Spanned;I[Lcom/flyersoft/components/CSS$BackgroundColorSpan;)V
    .locals 12

    move-object/from16 v0, p8

    if-eqz v0, :cond_0

    .line 791
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v11, v0, v2

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    .line 792
    invoke-direct/range {v3 .. v11}, Lcom/flyersoft/staticlayout/MRTextView;->drawBackgroundColorSpan(Landroid/graphics/Canvas;IIFFLandroid/text/Spanned;ILcom/flyersoft/components/CSS$BackgroundColorSpan;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private drawLineHighlight(Landroid/graphics/Canvas;IIIIJJIZZZLcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/A$Bookmark;)V
    .locals 27

    move-object/from16 v0, p0

    move/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    move-wide/from16 v5, p6

    move-wide/from16 v7, p8

    move/from16 v9, p10

    move-object/from16 v10, p14

    move-object/from16 v11, p15

    cmp-long v12, v7, v5

    if-lez v12, :cond_2e

    .line 1668
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v12

    invoke-interface {v12}, Ljava/lang/CharSequence;->length()I

    move-result v12

    int-to-long v12, v12

    cmp-long v14, v7, v12

    if-lez v14, :cond_0

    goto/16 :goto_14

    :cond_0
    int-to-long v12, v3

    cmp-long v16, v5, v12

    if-lez v16, :cond_1

    int-to-long v14, v4

    cmp-long v18, v5, v14

    if-gez v18, :cond_1

    const/4 v14, 0x1

    goto :goto_0

    :cond_1
    const/4 v14, 0x0

    :goto_0
    if-gtz v16, :cond_2

    cmp-long v15, v7, v12

    if-lez v15, :cond_2

    const/4 v15, 0x1

    goto :goto_1

    :cond_2
    const/4 v15, 0x0

    :goto_1
    if-nez v14, :cond_3

    if-eqz v15, :cond_2e

    :cond_3
    if-eqz v10, :cond_f

    .line 1675
    iget-boolean v14, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->checkRealPosition:Z

    if-nez v14, :cond_f

    const/4 v14, 0x1

    .line 1676
    iput-boolean v14, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->checkRealPosition:Z

    .line 1677
    iget-object v14, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-static {v14}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    goto/16 :goto_14

    .line 1679
    :cond_4
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v14

    move-wide/from16 v18, v12

    long-to-int v12, v5

    long-to-int v13, v7

    invoke-virtual {v14, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 1680
    iget-object v13, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_10

    .line 1681
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v12

    iget-object v13, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v12, v13, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    int-to-long v13, v12

    cmp-long v16, v13, v5

    if-eqz v16, :cond_10

    .line 1684
    sget-boolean v13, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    if-eqz v13, :cond_5

    const/16 v13, 0x4b0

    goto :goto_2

    :cond_5
    const/16 v13, 0xc8

    :goto_2
    const/4 v14, -0x1

    if-eq v12, v14, :cond_6

    sub-int v14, v12, v3

    if-le v14, v13, :cond_7

    .line 1685
    :cond_6
    div-int/lit8 v14, v13, 0x4

    if-le v3, v14, :cond_7

    move/from16 v20, v14

    .line 1686
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v14

    move/from16 v21, v15

    iget-object v15, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    sub-int v1, v3, v20

    invoke-virtual {v14, v15, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_3

    :cond_7
    move/from16 v21, v15

    move v1, v12

    :goto_3
    const/4 v14, -0x1

    if-ne v1, v14, :cond_8

    .line 1687
    div-int/lit8 v14, v13, 0x2

    if-le v3, v14, :cond_8

    .line 1688
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    iget-object v15, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    sub-int v14, v3, v14

    invoke-virtual {v1, v15, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    :cond_8
    const/4 v14, -0x1

    if-ne v1, v14, :cond_9

    if-le v3, v13, :cond_9

    .line 1690
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    iget-object v15, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    sub-int v14, v3, v13

    invoke-virtual {v1, v15, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    :cond_9
    const/4 v14, -0x1

    if-eq v1, v14, :cond_a

    int-to-long v14, v1

    sub-long v22, v5, v14

    .line 1691
    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->abs(J)J

    move-result-wide v22

    move-wide/from16 v24, v14

    int-to-long v13, v13

    cmp-long v1, v22, v13

    if-gez v1, :cond_a

    .line 1692
    iget-wide v12, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    sub-long v14, v24, v5

    add-long/2addr v12, v14

    iput-wide v12, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    :goto_4
    const/4 v1, 0x1

    goto :goto_7

    .line 1695
    :cond_a
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    iget-object v13, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v1, v13, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v14, -0x1

    if-ne v1, v14, :cond_b

    if-eq v12, v14, :cond_11

    :cond_b
    if-ne v1, v14, :cond_c

    goto :goto_6

    :cond_c
    if-ne v12, v14, :cond_d

    goto :goto_5

    :cond_d
    sub-int v13, v3, v1

    sub-int v14, v12, v3

    if-le v13, v14, :cond_e

    goto :goto_6

    :cond_e
    :goto_5
    move v12, v1

    .line 1699
    :goto_6
    iget-wide v13, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    move-wide v15, v13

    int-to-long v12, v12

    sub-long/2addr v12, v5

    add-long/2addr v12, v15

    iput-wide v12, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    goto :goto_4

    :cond_f
    move-wide/from16 v18, v12

    :cond_10
    move/from16 v21, v15

    :cond_11
    const/4 v1, 0x0

    .line 1707
    :goto_7
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v12

    if-eqz v12, :cond_12

    goto/16 :goto_14

    :cond_12
    if-eqz v11, :cond_13

    .line 1711
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop(I)I

    move-result v1

    iput v1, v11, Lcom/flyersoft/tools/A$Bookmark;->drawY:I

    .line 1712
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1}, Lcom/flyersoft/tools/A;->fixIndentBookmarkPos(Lcom/flyersoft/tools/A$Bookmark;Ljava/lang/String;)Z

    .line 1714
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_13
    if-eqz v1, :cond_14

    const/4 v14, 0x1

    .line 1719
    iput-boolean v14, v0, Lcom/flyersoft/staticlayout/MRTextView;->forceRedraw:Z

    return-void

    .line 1724
    :cond_14
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isEmptyLine(I)Z

    move-result v1

    if-eqz v1, :cond_15

    goto/16 :goto_14

    .line 1727
    :cond_15
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v1

    .line 1728
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v11

    if-eqz v21, :cond_17

    move v12, v3

    :goto_8
    if-ge v12, v4, :cond_16

    .line 1733
    invoke-interface {v11, v12}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v13

    invoke-static {v13}, Lcom/flyersoft/tools/A;->isEmptyChar(C)Z

    move-result v13

    if-eqz v13, :cond_16

    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 1735
    :cond_16
    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v12

    goto :goto_9

    :cond_17
    long-to-int v12, v5

    .line 1737
    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v12

    :goto_9
    float-to-int v12, v12

    int-to-float v12, v12

    int-to-long v13, v4

    cmp-long v15, v7, v13

    if-ltz v15, :cond_19

    :goto_a
    add-int/lit8 v13, v4, -0x1

    int-to-long v14, v13

    cmp-long v16, v14, v5

    if-lez v16, :cond_1a

    if-le v13, v3, :cond_1a

    .line 1740
    invoke-interface {v11, v13}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v14

    const/16 v15, 0x20

    if-eq v14, v15, :cond_18

    invoke-interface {v11, v13}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v13

    const/16 v14, 0xa

    if-ne v13, v14, :cond_1a

    :cond_18
    add-int/lit8 v4, v4, -0x1

    goto :goto_a

    :cond_19
    long-to-int v4, v7

    .line 1745
    :cond_1a
    invoke-virtual {v0, v2, v4}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v3

    float-to-int v3, v3

    int-to-float v3, v3

    .line 1748
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v11

    mul-int/lit8 v11, v11, 0x6e

    div-int/lit8 v11, v11, 0x64

    if-le v1, v11, :cond_1b

    long-to-int v1, v5

    long-to-int v5, v7

    .line 1749
    invoke-direct {v0, v1, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getTextRealHeight(II)I

    move-result v1

    .line 1753
    :cond_1b
    invoke-direct {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isRtf(I)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 1755
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->selfDrawLine(I)Z

    move-result v5

    if-eqz v5, :cond_1c

    move/from16 v26, v12

    move v12, v3

    move/from16 v3, v26

    goto :goto_b

    .line 1759
    :cond_1c
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    .line 1760
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v3

    int-to-float v3, v3

    sub-float v12, v3, v12

    move v3, v12

    move v12, v5

    .line 1764
    :cond_1d
    :goto_b
    div-int/lit8 v5, v1, 0x4

    const/16 v17, 0x1

    add-int/lit8 v5, v5, 0x1

    .line 1765
    sget-boolean v6, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v6, :cond_1e

    div-int/lit8 v6, v1, 0x6

    goto :goto_c

    :cond_1e
    const/4 v6, 0x0

    :goto_c
    sub-int v7, p3, v1

    add-int/2addr v7, v5

    add-int v5, p3, v5

    const/high16 v13, 0x3f800000    # 1.0f

    if-nez p11, :cond_21

    if-nez p12, :cond_21

    if-eqz p13, :cond_1f

    goto :goto_e

    :cond_1f
    if-eqz v9, :cond_20

    .line 1791
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 1792
    invoke-virtual {v1, v9}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v14, 0x1

    .line 1793
    invoke-virtual {v1, v14}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    sub-int v9, v5, v7

    .line 1794
    div-int/lit8 v9, v9, 0x1e

    add-int/2addr v7, v6

    add-int/2addr v5, v6

    .line 1797
    new-instance v14, Landroid/graphics/RectF;

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v15

    int-to-float v15, v15

    sub-float v15, v12, v15

    const/high16 p15, 0x40400000    # 3.0f

    add-int v8, v7, v9

    int-to-float v8, v8

    const/high16 v16, 0x40000000    # 2.0f

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    int-to-float v11, v11

    add-float/2addr v3, v11

    sub-int v9, v5, v9

    int-to-float v9, v9

    invoke-direct {v14, v15, v8, v3, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    sub-int/2addr v5, v7

    div-int/lit8 v5, v5, 0x3

    int-to-float v3, v5

    const/high16 v5, 0x42c80000    # 100.0f

    move-object/from16 v8, p1

    invoke-virtual {v8, v14, v3, v5, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    move-object v1, v8

    :goto_d
    move v3, v12

    goto/16 :goto_10

    :cond_20
    const/high16 p15, 0x40400000    # 3.0f

    const/high16 v16, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    goto :goto_d

    :cond_21
    :goto_e
    move-object/from16 v8, p1

    const/high16 p15, 0x40400000    # 3.0f

    const/high16 v16, 0x40000000    # 2.0f

    .line 1770
    new-instance v11, Landroid/graphics/Paint;

    invoke-direct {v11}, Landroid/graphics/Paint;-><init>()V

    .line 1771
    sget v14, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v15, 0x41100000    # 9.0f

    div-float/2addr v14, v15

    invoke-static {}, Lcom/flyersoft/tools/A;->getDensity()F

    move-result v15

    mul-float v14, v14, v15

    .line 1772
    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v15

    int-to-float v15, v15

    cmpg-float v15, v14, v15

    if-gez v15, :cond_22

    .line 1773
    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    int-to-float v14, v14

    .line 1774
    :cond_22
    invoke-virtual {v11, v14}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v14, -0xaaaaab

    if-eqz p11, :cond_24

    if-nez v9, :cond_23

    const v9, -0xaaaaab

    .line 1777
    :cond_23
    invoke-virtual {v11, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 1778
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v1, v1, p15

    const/high16 v5, 0x41900000    # 18.0f

    div-float/2addr v1, v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    add-int v1, p3, v1

    add-int/2addr v1, v6

    int-to-float v1, v1

    move v5, v1

    move/from16 p5, v1

    move/from16 p6, v3

    move/from16 p7, v5

    move-object/from16 p3, v8

    move-object/from16 p8, v11

    move/from16 p4, v12

    .line 1779
    invoke-virtual/range {p3 .. p8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v1, p1

    move/from16 v3, p4

    goto/16 :goto_10

    :cond_24
    move v8, v12

    move v12, v3

    move v3, v8

    move-object v8, v11

    if-eqz p12, :cond_26

    if-nez v9, :cond_25

    const v9, -0xaaaaab

    .line 1781
    :cond_25
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 1782
    sget v9, Lcom/flyersoft/tools/A;->lineSpace:I

    rsub-int/lit8 v9, v9, 0x2f

    mul-int v1, v1, v9

    div-int/lit8 v1, v1, 0x64

    sub-int/2addr v5, v1

    const/16 v17, 0x1

    add-int/lit8 v5, v5, -0x1

    add-int/2addr v5, v6

    int-to-float v1, v5

    move v5, v1

    move-object/from16 p3, p1

    move/from16 p5, v1

    move/from16 p4, v3

    move/from16 p7, v5

    move-object/from16 p8, v8

    move/from16 p6, v12

    .line 1783
    invoke-virtual/range {p3 .. p8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v1, p1

    goto :goto_10

    :cond_26
    if-nez v9, :cond_27

    const v1, -0xff0100

    goto :goto_f

    :cond_27
    move v1, v9

    .line 1785
    :goto_f
    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1786
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v5, 0x40a00000    # 5.0f

    div-float/2addr v1, v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    .line 1787
    sget v5, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v5, v5, v16

    const/high16 v9, 0x41880000    # 17.0f

    div-float/2addr v5, v9

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    add-int v5, p3, v5

    add-int/2addr v5, v6

    int-to-float v5, v5

    int-to-float v1, v1

    move v9, v5

    move-object/from16 p3, p1

    move/from16 p9, v1

    move/from16 p4, v3

    move/from16 p5, v5

    move-object/from16 p8, v8

    move/from16 p7, v9

    move/from16 p6, v12

    .line 1788
    invoke-static/range {p3 .. p9}, Lcom/flyersoft/tools/A;->drawSquiggly(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;F)V

    move-object/from16 v1, p3

    :goto_10
    if-eqz v10, :cond_2c

    .line 1801
    iget-object v5, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2c

    .line 1802
    iget-boolean v5, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->isHighlightAllItem:Z

    if-eqz v5, :cond_28

    sget v5, Lcom/flyersoft/tools/A;->noteImg:I

    if-nez v5, :cond_28

    const/4 v14, 0x1

    goto :goto_11

    :cond_28
    const/4 v14, 0x0

    :goto_11
    if-nez v14, :cond_29

    .line 1803
    sget-boolean v5, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z

    if-eqz v5, :cond_29

    invoke-static/range {v18 .. v19}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v8

    move-wide/from16 v18, v8

    :cond_29
    if-nez v14, :cond_2a

    .line 1804
    sget-boolean v5, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z

    if-eqz v5, :cond_2a

    int-to-long v4, v4

    invoke-static {v4, v5}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v4

    goto :goto_12

    :cond_2a
    int-to-long v4, v4

    .line 1805
    :goto_12
    iget-wide v8, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v11, v8, v18

    if-ltz v11, :cond_2c

    iget-wide v8, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v11, v8, v4

    if-gtz v11, :cond_2c

    .line 1806
    invoke-static {}, Lcom/flyersoft/staticlayout/MRTextView;->getNoteBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1807
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v5

    .line 1808
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 1811
    invoke-static/range {p15 .. p15}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    sub-int v9, v7, v9

    add-int/2addr v9, v6

    .line 1812
    sget v6, Lcom/flyersoft/tools/A;->noteImg:I

    if-eqz v6, :cond_2b

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getScrollY()I

    move-result v6

    if-ge v9, v6, :cond_2b

    .line 1813
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getScrollY()I

    move-result v9

    .line 1814
    :cond_2b
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    int-to-float v6, v6

    sub-float v12, v3, v6

    int-to-float v6, v9

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v9, v3

    mul-int/lit8 v11, v5, 0x69

    div-int/lit8 v11, v11, 0x64

    int-to-float v15, v11

    add-float/2addr v9, v15

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v13

    add-int/2addr v13, v7

    mul-int/lit8 v5, v5, 0x64

    div-int/lit8 v5, v5, 0x64

    add-int/2addr v13, v5

    int-to-float v5, v13

    move-object/from16 p3, v0

    move/from16 p7, v5

    move/from16 p5, v6

    move-object/from16 p9, v8

    move/from16 p6, v9

    move/from16 p4, v12

    move/from16 p8, v14

    invoke-direct/range {p3 .. p9}, Lcom/flyersoft/staticlayout/MRTextView;->rectF(FFFFZLandroid/graphics/Paint;)Landroid/graphics/RectF;

    move-result-object v0

    move-object/from16 v5, p3

    move-object/from16 v6, p9

    .line 1815
    new-instance v8, Landroid/graphics/Rect;

    .line 1816
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    const/4 v13, 0x0

    invoke-direct {v8, v13, v13, v9, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1815
    invoke-virtual {v1, v4, v8, v0, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1819
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 1820
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-ne v10, v4, :cond_2d

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hBarVisible()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 1821
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 1822
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1823
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/4 v14, 0x1

    .line 1824
    invoke-virtual {v6, v14}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/16 v0, 0x78

    .line 1825
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1826
    div-int/lit8 v11, v11, 0x2

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    add-int/2addr v11, v0

    int-to-float v0, v11

    .line 1827
    invoke-static/range {p15 .. p15}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    sub-float v12, v3, v4

    add-float/2addr v12, v0

    invoke-static/range {p15 .. p15}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    sub-int/2addr v7, v3

    int-to-float v3, v7

    add-float/2addr v3, v0

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v0, v4

    invoke-virtual {v1, v12, v3, v0, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_13

    :cond_2c
    move-object v5, v0

    .line 1832
    :cond_2d
    :goto_13
    iget-object v0, v5, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 1833
    iget-object v0, v5, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2e
    :goto_14
    move-object v5, v0

    :cond_2f
    return-void
.end method

.method private drawMRSpanLines(Landroid/graphics/Canvas;)V
    .locals 21

    .line 828
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    if-eqz v0, :cond_14

    .line 829
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;

    .line 830
    iget-object v0, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 833
    :cond_1
    new-instance v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;

    invoke-direct {v9}, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;-><init>()V

    .line 834
    iget v0, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    iput v0, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    .line 835
    iget-object v0, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v11, 0x0

    if-eqz v0, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    .line 836
    iget-object v1, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineWords(Ljava/lang/String;IZLjava/util/ArrayList;FZ)Ljava/util/ArrayList;

    move-result-object v1

    .line 837
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_6

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 839
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 840
    new-instance v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Ljava/lang/String;

    iget v4, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget v5, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->y:F

    iget-object v6, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    iget v12, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    add-int v19, v12, v3

    iget v12, v13, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->end:I

    add-int v20, v12, v3

    move/from16 v16, v4

    move/from16 v17, v5

    move-object/from16 v18, v6

    invoke-direct/range {v14 .. v20}, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;-><init>(Ljava/lang/String;FFLandroid/text/TextPaint;II)V

    .line 841
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    .line 842
    :goto_3
    iget-object v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-virtual {v4, v11}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 843
    iget-object v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    .line 844
    iget v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    add-int/2addr v4, v5

    iput v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    goto :goto_3

    .line 846
    :cond_3
    sget-boolean v4, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    if-eqz v4, :cond_4

    iget v4, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    iget v5, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v4

    goto :goto_4

    :cond_4
    iget v4, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    iget v5, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX2(II)F

    move-result v4

    :goto_4
    iput v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    .line 847
    iget v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    const/high16 v5, -0x40800000    # -1.0f

    cmpl-float v4, v4, v5

    if-nez v4, :cond_5

    .line 848
    iget v4, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    iget v5, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v4

    iput v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    .line 849
    :cond_5
    iget-object v4, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    .line 852
    :cond_6
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_7
    move-object/from16 v0, p0

    .line 855
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v10, 0x0

    const/4 v5, 0x1

    if-le v6, v5, :cond_8

    .line 856
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    cmpg-float v1, v1, v10

    if-gtz v1, :cond_8

    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getItalicIgnoreWidth()F

    move-result v1

    move v12, v1

    goto :goto_5

    :cond_8
    const/4 v12, 0x0

    :goto_5
    const/4 v5, 0x1

    if-le v6, v5, :cond_9

    .line 857
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    add-int/lit8 v2, v6, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getItalicIgnoreWidth()F

    move-result v1

    move v13, v1

    goto :goto_6

    :cond_9
    const/4 v13, 0x0

    .line 859
    :goto_6
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->mrSpansOverflow(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 861
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    add-int/lit8 v2, v6, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    .line 862
    iget v3, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget-object v4, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    iget-object v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    invoke-static {v4, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v1

    add-float/2addr v3, v1

    .line 863
    iget v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v1

    .line 864
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v4

    int-to-float v4, v4

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v1, v5

    sub-float/2addr v4, v1

    sub-float/2addr v3, v13

    cmpl-float v1, v3, v4

    if-lez v1, :cond_a

    const/4 v5, 0x1

    goto :goto_7

    :cond_a
    const/4 v5, 0x0

    :goto_7
    if-eqz v5, :cond_c

    const/4 v1, 0x1

    if-le v6, v1, :cond_c

    sub-float/2addr v3, v4

    int-to-float v1, v2

    div-float/2addr v3, v1

    const/4 v5, 0x1

    :goto_8
    if-ge v5, v6, :cond_b

    .line 869
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    int-to-float v4, v5

    mul-float v4, v4, v3

    sub-float/2addr v2, v4

    iput v2, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_b
    const/4 v1, 0x0

    goto :goto_9

    :cond_c
    move v1, v5

    :goto_9
    if-nez v1, :cond_d

    .line 873
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->mrSpansOverflow(Ljava/util/ArrayList;)Z

    move-result v1

    :cond_d
    if-nez v1, :cond_12

    :goto_a
    if-ge v11, v6, :cond_11

    .line 878
    iget-object v1, v9, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    cmpl-float v1, v12, v10

    if-lez v1, :cond_e

    .line 879
    iget v1, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    add-int/lit8 v2, v6, -0x1

    sub-int v3, v2, v11

    int-to-float v3, v3

    mul-float v3, v3, v12

    int-to-float v2, v2

    div-float/2addr v3, v2

    add-float/2addr v1, v3

    iput v1, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    :cond_e
    cmpl-float v1, v13, v10

    if-lez v1, :cond_f

    .line 880
    iget v1, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    int-to-float v2, v11

    mul-float v2, v2, v13

    add-int/lit8 v3, v6, -0x1

    int-to-float v3, v3

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    .line 881
    :cond_f
    iget-object v2, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    iget v3, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->y:F

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V

    .line 882
    sget-boolean v1, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-eqz v1, :cond_10

    .line 883
    iget v1, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    iget v2, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget v3, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget-object v4, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    iget-object v5, v14, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    invoke-static {v4, v5}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v4

    add-float/2addr v3, v4

    move-object/from16 v4, p1

    invoke-direct {v0, v4, v1, v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->drawUnderline(Landroid/graphics/Canvas;IFF)V

    goto :goto_b

    :cond_10
    move-object/from16 v4, p1

    :goto_b
    add-int/lit8 v11, v11, 0x1

    goto :goto_a

    :cond_11
    move-object/from16 v4, p1

    goto/16 :goto_0

    :cond_12
    move-object/from16 v4, p1

    .line 886
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "#broken#"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineText(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x1

    new-array v2, v5, [Ljava/lang/Object;

    aput-object v1, v2, v11

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 887
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    iget v2, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 888
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    iget v2, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 889
    :cond_13
    iget-object v1, v8, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    .line 890
    iget-object v2, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    iget v3, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    iget v4, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->y:F

    iget-object v5, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    goto :goto_c

    :cond_14
    const/4 v0, 0x0

    .line 895
    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    return-void
.end method

.method private drawRTL(Landroid/graphics/Canvas;Ljava/lang/CharSequence;ZIIIFFLandroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)Z
    .locals 1

    if-eqz p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 435
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p3

    invoke-static {p2, p5, p6, p3}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result p3

    .line 436
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, p7

    sub-float/2addr v0, p3

    const/high16 p3, 0x3fc00000    # 1.5f

    invoke-static {p3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result p3

    sub-float/2addr v0, p3

    iget p3, p10, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    sub-float/2addr v0, p3

    .line 437
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result p3

    int-to-float p3, p3

    cmpl-float p3, v0, p3

    if-lez p3, :cond_1

    .line 438
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result p3

    int-to-float v0, p3

    .line 439
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p3

    invoke-virtual {p3, p4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result p3

    int-to-float p3, p3

    add-float/2addr v0, p3

    move-object p4, p1

    move p7, p6

    move-object p10, p9

    move p6, p5

    move p9, p8

    move p8, v0

    move-object p5, p2

    .line 440
    invoke-virtual/range {p4 .. p10}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    const/4 p1, 0x1

    return p1
.end method

.method private drawRuby(Landroid/text/Spanned;[Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFILjava/lang/String;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)V
    .locals 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p9

    .line 463
    iget-boolean v3, v0, Lcom/flyersoft/staticlayout/MRTextView;->hasRuby:Z

    if-nez v3, :cond_0

    iget-boolean v3, v0, Lcom/flyersoft/staticlayout/MRTextView;->hasEmphasis:Z

    if-nez v3, :cond_0

    goto/16 :goto_13

    .line 468
    :cond_0
    const-class v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 469
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v3

    const-class v5, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-interface {v3, v8, v9, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 470
    :goto_0
    const-class v5, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    invoke-static {v2, v5}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 471
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2

    const-class v5, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    invoke-interface {v2, v8, v9, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-eqz v3, :cond_3

    .line 473
    array-length v5, v3

    if-gtz v5, :cond_4

    :cond_3
    if-eqz v2, :cond_1b

    array-length v5, v2

    if-lez v5, :cond_1b

    .line 474
    :cond_4
    invoke-virtual {v0, v10}, Lcom/flyersoft/staticlayout/MRTextView;->getLineRecord(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v11

    .line 475
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v12

    .line 476
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v13

    .line 477
    new-instance v14, Landroid/text/TextPaint;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    invoke-direct {v14, v5}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 478
    invoke-virtual {v14}, Landroid/text/TextPaint;->getTextSize()F

    move-result v5

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v5, v5, v6

    invoke-virtual {v14, v5}, Landroid/text/TextPaint;->setTextSize(F)V

    if-eqz v2, :cond_b

    .line 482
    new-instance v5, Landroid/text/TextPaint;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 483
    invoke-virtual {v5}, Landroid/text/TextPaint;->getTextSize()F

    move-result v6

    const v7, 0x3f333333    # 0.7f

    mul-float v6, v6, v7

    invoke-virtual {v5, v6}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 484
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v6

    .line 486
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v15, 0x0

    .line 487
    :goto_2
    array-length v4, v2

    if-ge v15, v4, :cond_7

    .line 488
    aget-object v4, v2, v15

    invoke-interface {v1, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    move-object/from16 p10, v2

    .line 489
    aget-object v2, p10, v15

    invoke-interface {v1, v2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    :goto_3
    if-ge v4, v2, :cond_6

    if-lt v4, v12, :cond_5

    if-ge v4, v6, :cond_5

    .line 492
    new-instance v1, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    move/from16 v16, v2

    aget-object v2, p10, v15

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;->emphasis:Ljava/lang/String;

    move-object/from16 v17, v5

    add-int/lit8 v5, v4, 0x1

    move/from16 v18, v6

    const/4 v6, 0x0

    invoke-direct {v1, v2, v6, v4, v5}, Lcom/flyersoft/staticlayout/MyHtml$Ruby;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_5
    move/from16 v16, v2

    move-object/from16 v17, v5

    move/from16 v18, v6

    const/4 v6, 0x0

    :goto_4
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p1

    move/from16 v2, v16

    move-object/from16 v5, v17

    move/from16 v6, v18

    goto :goto_3

    :cond_6
    move-object/from16 v17, v5

    move/from16 v18, v6

    const/4 v6, 0x0

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, p1

    move-object/from16 v2, p10

    move/from16 v6, v18

    goto :goto_2

    :cond_7
    move-object/from16 v17, v5

    if-nez v3, :cond_8

    const/4 v1, 0x0

    goto :goto_5

    .line 494
    :cond_8
    array-length v1, v3

    .line 495
    :goto_5
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v2, v1

    new-array v2, v2, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    if-eqz v3, :cond_9

    const/4 v4, 0x0

    .line 497
    :goto_6
    array-length v5, v3

    if-ge v4, v5, :cond_9

    aget-object v5, v3, v4

    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    :cond_9
    const/4 v3, 0x0

    .line 498
    :goto_7
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_a

    add-int v4, v3, v1

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    aput-object v5, v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_a
    move-object v15, v2

    goto :goto_8

    :cond_b
    const/4 v6, 0x0

    move-object v15, v3

    move-object/from16 v17, v6

    :goto_8
    move-object/from16 v1, p11

    .line 502
    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->top:F

    const/16 v16, 0x0

    const/16 v18, 0x1

    cmpl-float v1, v1, v16

    if-lez v1, :cond_c

    const/4 v1, 0x1

    goto :goto_9

    :cond_c
    const/4 v1, 0x0

    :goto_9
    if-nez v1, :cond_e

    .line 504
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, v10}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTopAdded2(I)I

    move-result v1

    if-lez v1, :cond_d

    const/4 v1, 0x1

    goto :goto_a

    :cond_d
    const/4 v1, 0x0

    :cond_e
    :goto_a
    move/from16 v19, v1

    .line 506
    array-length v1, v15

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v1, :cond_1b

    aget-object v3, v15, v2

    .line 507
    iget v4, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    iget v5, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    if-le v4, v5, :cond_1a

    iget-object v4, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 508
    iget-object v4, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    .line 509
    iget v5, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    .line 510
    iget v6, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    .line 511
    iget-object v7, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    if-eqz v7, :cond_10

    if-ge v5, v8, :cond_f

    sub-int v7, v8, v5

    .line 514
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v20

    mul-int v20, v20, v7

    sub-int v5, v6, v5

    div-int v5, v20, v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    move v5, v8

    :cond_f
    if-le v6, v9, :cond_10

    sub-int v7, v6, v9

    .line 519
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v20

    sub-int/2addr v6, v5

    sub-int v7, v6, v7

    mul-int v20, v20, v7

    div-int v6, v20, v6

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    move v6, v9

    goto :goto_c

    :cond_10
    const/4 v7, 0x0

    :goto_c
    if-eqz v11, :cond_13

    .line 526
    iget-object v7, v11, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    sub-int/2addr v5, v12

    if-gez v5, :cond_11

    const/4 v5, 0x0

    :cond_11
    aget v5, v7, v5

    .line 527
    iget-object v7, v11, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    sub-int/2addr v6, v12

    add-int/lit8 v6, v6, -0x1

    move/from16 v20, v1

    iget-object v1, v11, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-le v6, v1, :cond_12

    iget-object v1, v11, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    array-length v1, v1

    add-int/lit8 v6, v1, -0x1

    :cond_12
    aget v1, v7, v6

    move-object/from16 p7, v11

    move-object/from16 v11, p4

    goto :goto_d

    :cond_13
    move/from16 v20, v1

    .line 530
    invoke-virtual {v0, v10, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result v1

    .line 531
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    move-object/from16 p7, v11

    move-object/from16 v11, p4

    invoke-static {v11, v5, v6, v7}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v5

    add-float/2addr v5, v1

    move/from16 v23, v5

    move v5, v1

    move/from16 v1, v23

    .line 534
    :goto_d
    iget-object v6, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    if-nez v6, :cond_14

    move-object/from16 v7, v17

    goto :goto_e

    :cond_14
    move-object v7, v14

    .line 535
    :goto_e
    invoke-static {v4, v7}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v6

    sub-float/2addr v1, v5

    sub-float v1, v6, v1

    const/high16 v21, 0x40000000    # 2.0f

    div-float v1, v1, v21

    sub-float/2addr v5, v1

    add-float v1, v5, v6

    move/from16 p1, v1

    .line 538
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_15

    .line 539
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v1

    int-to-float v1, v1

    sub-float v5, v1, v6

    :cond_15
    cmpg-float v1, v5, v16

    if-gez v1, :cond_16

    const/4 v5, 0x0

    .line 544
    :cond_16
    iget-object v1, v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    if-nez v1, :cond_17

    .line 545
    invoke-virtual {v0, v10}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x9

    div-int/lit8 v1, v1, 0x64

    :goto_f
    add-int/2addr v1, v13

    goto :goto_10

    .line 546
    :cond_17
    sget-boolean v1, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v1, :cond_18

    .line 547
    invoke-virtual {v0, v10}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x64

    goto :goto_f

    :cond_18
    move v1, v13

    :goto_10
    if-eqz v19, :cond_19

    .line 550
    invoke-direct {v0, v8, v9}, Lcom/flyersoft/staticlayout/MRTextView;->getTextRealHeight(II)I

    move-result v1

    move/from16 v3, p8

    float-to-int v6, v3

    mul-int/lit8 v1, v1, 0x41

    .line 551
    div-int/lit8 v1, v1, 0x64

    sub-int v1, v6, v1

    goto :goto_11

    :cond_19
    move/from16 v3, p8

    :goto_11
    move v6, v2

    move-object v2, v4

    .line 554
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    int-to-float v1, v1

    const/4 v3, 0x0

    move/from16 v21, v6

    const/16 v22, 0x0

    move v6, v1

    move-object/from16 v1, p3

    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    goto :goto_12

    :cond_1a
    move/from16 v20, v1

    move/from16 v21, v2

    move-object/from16 p7, v11

    const/16 v22, 0x0

    move-object/from16 v11, p4

    :goto_12
    add-int/lit8 v2, v21, 0x1

    move-object/from16 v0, p0

    move-object/from16 v11, p7

    move/from16 v1, v20

    goto/16 :goto_b

    :cond_1b
    :goto_13
    return-void
.end method

.method private drawTableZoomIcon(Landroid/graphics/Canvas;[Ljava/lang/Object;II)V
    .locals 9

    const-wide/16 v0, 0x64

    const/4 p4, 0x0

    if-eqz p2, :cond_2

    .line 386
    array-length v2, p2

    const/4 v3, 0x0

    move-object v3, p4

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, p2, v4

    .line 387
    instance-of v6, v5, Lcom/flyersoft/staticlayout/MyTableSpan;

    if-eqz v6, :cond_0

    .line 388
    move-object p4, v5

    check-cast p4, Lcom/flyersoft/staticlayout/MyTableSpan;

    .line 389
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->renderTime:J

    sub-long/2addr v5, v7

    cmp-long v7, v5, v0

    if-lez v7, :cond_1

    const-wide/16 v5, -0x1

    .line 390
    iput-wide v5, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->renderTime:J

    goto :goto_1

    .line 391
    :cond_0
    instance-of v6, v5, Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eqz v6, :cond_1

    .line 392
    check-cast v5, Lcom/flyersoft/staticlayout/MyMarginSpan;

    iget-boolean v6, v5, Lcom/flyersoft/staticlayout/MyMarginSpan;->isTable:Z

    if-eqz v6, :cond_1

    move-object v3, v5

    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    move-object v3, p4

    :cond_3
    if-eqz p4, :cond_6

    if-eqz v3, :cond_6

    .line 397
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getScrollY()I

    move-result p2

    .line 398
    iget v2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->spStart:I

    if-eq v2, p3, :cond_4

    iget p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    int-to-float v2, p2

    cmpl-float p3, p3, v2

    if-lez p3, :cond_6

    iget p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 399
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getTxtHeight()I

    move-result v2

    add-int/2addr p2, v2

    int-to-float p2, p2

    cmpg-float p2, p3, p2

    if-gez p2, :cond_6

    .line 400
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p2

    iget-wide v4, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->renderTime:J

    sub-long/2addr p2, v4

    cmp-long v2, p2, v0

    if-lez v2, :cond_6

    .line 401
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p2

    iput-wide p2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->renderTime:J

    .line 402
    iget p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iput p2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->l:F

    .line 403
    iget p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iput p2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->t:F

    .line 404
    iget p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iput p2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->r:F

    .line 405
    iget p2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    iput p2, p4, Lcom/flyersoft/staticlayout/MyTableSpan;->b:F

    .line 406
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->tableIcon:Landroid/graphics/drawable/Drawable;

    if-nez p2, :cond_5

    .line 407
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$drawable;->zoomhtml:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->tableIcon:Landroid/graphics/drawable/Drawable;

    :cond_5
    const/high16 p2, 0x41700000    # 15.0f

    .line 408
    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    .line 409
    iget p3, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    int-to-float p4, p2

    sub-float/2addr p3, p4

    float-to-int p3, p3

    .line 410
    iget p4, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    float-to-int p4, p4

    .line 411
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->tableIcon:Landroid/graphics/drawable/Drawable;

    add-int v1, p3, p2

    add-int/2addr p2, p4

    invoke-virtual {v0, p3, p4, v1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 412
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->tableIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_6
    return-void
.end method

.method private drawUnderline(Landroid/graphics/Canvas;IFF)V
    .locals 7

    .line 331
    invoke-virtual {p0, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v0

    .line 332
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v1

    int-to-float v1, v1

    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v1, v2

    cmpl-float v1, p4, v1

    if-lez v1, :cond_0

    .line 333
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result p4

    int-to-float p4, p4

    iget v0, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr p4, v0

    :cond_0
    move v3, p4

    const/4 p4, 0x0

    .line 335
    invoke-virtual {p0, p2, p4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineBounds(ILandroid/graphics/Rect;)I

    move-result p4

    const/high16 v0, 0x40400000    # 3.0f

    .line 336
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v1, v1, v0

    const/high16 v0, 0x41900000    # 18.0f

    div-float/2addr v1, v0

    const/high16 v0, 0x3fc00000    # 1.5f

    add-float/2addr v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    add-int/2addr p4, v0

    int-to-float p4, p4

    .line 337
    sget-boolean v0, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v0, :cond_1

    .line 338
    invoke-virtual {p0, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result p2

    div-int/lit8 p2, p2, 0x6

    int-to-float p2, p2

    add-float/2addr p4, p2

    :cond_1
    move v2, p4

    .line 339
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    const p2, 0x3f19999a    # 0.6f

    .line 340
    invoke-static {p2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result p2

    const/high16 p4, 0x3f800000    # 1.0f

    cmpg-float v0, p2, p4

    if-gez v0, :cond_2

    const/high16 p2, 0x3f800000    # 1.0f

    .line 343
    :cond_2
    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 344
    sget p2, Lcom/flyersoft/tools/A;->fontColor:I

    const/high16 v0, -0x1000000

    if-ne p2, v0, :cond_3

    const p2, -0xaaaaab

    goto :goto_0

    :cond_3
    sget p2, Lcom/flyersoft/tools/A;->fontColor:I

    :goto_0
    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setColor(I)V

    const/16 p2, 0xb4

    .line 345
    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    const/4 p2, 0x1

    .line 346
    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 347
    sget-boolean v0, Lcom/flyersoft/tools/A;->dashUnderline:Z

    if-eqz v0, :cond_4

    const/high16 v0, 0x40000000    # 2.0f

    .line 348
    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    .line 349
    invoke-static {p4}, Lcom/flyersoft/tools/A;->df(F)F

    move-result p4

    .line 350
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 351
    new-instance v1, Landroid/graphics/DashPathEffect;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v6, 0x0

    aput v0, v4, v6

    aput p4, v4, p2

    const/4 p2, 0x0

    invoke-direct {v1, v4, p2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 352
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    .line 353
    invoke-virtual {p2, p3, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 354
    invoke-virtual {p2, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 355
    invoke-virtual {p1, p2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_4
    move v4, v2

    move-object v0, p1

    move v1, p3

    .line 357
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public static getAlign(Lcom/flyersoft/staticlayout/AlignmentSpan;)I
    .locals 2

    const/4 v0, 0x1

    if-eqz p0, :cond_3

    .line 1128
    invoke-interface {p0}, Lcom/flyersoft/staticlayout/AlignmentSpan;->getAlignment()Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object p0

    .line 1129
    sget-object v1, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne p0, v1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    .line 1131
    :cond_0
    sget-object v1, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_JUSTIFY:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne p0, v1, :cond_1

    const/4 p0, 0x2

    goto :goto_0

    .line 1133
    :cond_1
    sget-object v1, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_CENTER:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne p0, v1, :cond_2

    const/4 p0, 0x3

    goto :goto_0

    .line 1135
    :cond_2
    sget-object v1, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne p0, v1, :cond_3

    const/4 p0, 0x4

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    :goto_0
    if-nez p0, :cond_4

    .line 1138
    sget v1, Lcom/flyersoft/staticlayout/MRTextView;->global_alignment:I

    if-le v1, v0, :cond_4

    return v1

    :cond_4
    return p0
.end method

.method public static getAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;
    .locals 1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 1145
    sget-object p0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_JUSTIFY:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object p0

    :cond_0
    const/4 v0, 0x3

    if-ne p0, v0, :cond_1

    .line 1147
    sget-object p0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_CENTER:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object p0

    :cond_1
    const/4 v0, 0x4

    if-ne p0, v0, :cond_2

    .line 1149
    sget-object p0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_RIGHT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object p0

    .line 1150
    :cond_2
    sget-object p0, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    return-object p0
.end method

.method public static getAlignmentSpan([Ljava/lang/Object;Landroid/text/Spanned;II)Lcom/flyersoft/staticlayout/AlignmentSpan;
    .locals 8

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    const/4 v1, 0x0

    move-object v1, v0

    const/4 v2, 0x0

    .line 1102
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_3

    .line 1103
    aget-object v3, p0, v2

    .line 1104
    instance-of v4, v3, Lcom/flyersoft/staticlayout/AlignmentSpan;

    if-eqz v4, :cond_2

    .line 1105
    check-cast v3, Lcom/flyersoft/staticlayout/AlignmentSpan;

    if-nez v0, :cond_0

    :goto_1
    move-object v0, v3

    goto :goto_2

    :cond_0
    if-nez v1, :cond_1

    .line 1110
    invoke-interface {p1, v0}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v1

    sub-int v1, p2, v1

    invoke-interface {p1, v0}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    sub-int/2addr v4, p3

    add-int/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1111
    :cond_1
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 1112
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    sub-int v6, p2, v4

    sub-int v7, v5, p3

    add-int/2addr v6, v7

    if-eq v4, v5, :cond_2

    .line 1114
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v6, v4, :cond_2

    .line 1116
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private getDesiredWidth(III)F
    .locals 7

    .line 2309
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasUnheritedSize(I)Z

    move-result p1

    if-eqz p1, :cond_7

    const/4 p1, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge p2, p3, :cond_6

    .line 2312
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v1

    add-int/lit8 v2, p2, 0x1

    const-class v3, Landroid/text/style/CharacterStyle;

    invoke-interface {v1, p2, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/text/style/CharacterStyle;

    .line 2314
    array-length v3, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_1
    if-ge v4, v3, :cond_0

    aget-object v6, v1, v4

    .line 2315
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2317
    :cond_0
    iget-object v3, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2318
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/text/TextPaint;

    goto :goto_4

    .line 2320
    :cond_1
    new-instance v3, Landroid/text/TextPaint;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 2321
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-eq v4, v6, :cond_2

    .line 2322
    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    :goto_2
    if-ltz v4, :cond_3

    .line 2323
    aget-object v6, v1, v4

    invoke-direct {p0, v3, v6}, Lcom/flyersoft/staticlayout/MRTextView;->updateState(Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;)V

    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 2325
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/flyersoft/staticlayout/Styled;->sortSpansForAndroid6(Landroid/text/Spanned;[Landroid/text/style/CharacterStyle;)V

    const/4 v4, 0x0

    .line 2326
    :goto_3
    array-length v6, v1

    if-ge v4, v6, :cond_3

    .line 2327
    aget-object v6, v1, v4

    invoke-direct {p0, v3, v6}, Lcom/flyersoft/staticlayout/MRTextView;->updateState(Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 2329
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v3

    .line 2331
    :goto_4
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge p2, v3, :cond_5

    .line 2332
    sget-boolean v3, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    if-eqz v3, :cond_4

    int-to-float v0, v0

    .line 2333
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3, p2, v2, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result p2

    goto :goto_5

    :cond_4
    int-to-float v0, v0

    .line 2335
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result p2

    :goto_5
    add-float/2addr v0, p2

    float-to-int v0, v0

    :cond_5
    move p2, v2

    goto/16 :goto_0

    :cond_6
    int-to-float p1, v0

    return p1

    .line 2341
    :cond_7
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-static {p1, p2, p3, v0}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 2343
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1
.end method

.method private getLineTextPureWidth(I)F
    .locals 3

    .line 2294
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2295
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    return p1

    .line 2296
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result v0

    .line 2297
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 2299
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v0

    int-to-float v0, v0

    .line 2301
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method private getMyOffset(IF)I
    .locals 7

    .line 2149
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineRecord(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 2151
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->isRtf(I)Z

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 2152
    :goto_0
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    array-length v4, v4

    if-ge p1, v4, :cond_3

    .line 2153
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v4, v4, p1

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    aget v5, v5, p1

    iget-object v6, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v6, v6, p1

    sub-float/2addr v5, v6

    add-float/2addr v5, v2

    div-float/2addr v5, v1

    add-float/2addr v4, v5

    cmpl-float v4, p2, v4

    if-lez v4, :cond_0

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 2158
    :cond_1
    iget-object p1, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    :goto_1
    if-ltz p1, :cond_3

    .line 2159
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v4, v4, p1

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    aget v5, v5, p1

    iget-object v6, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v6, v6, p1

    sub-float/2addr v5, v6

    add-float/2addr v5, v2

    div-float/2addr v5, v1

    add-float/2addr v4, v5

    cmpl-float v4, p2, v4

    if-lez v4, :cond_2

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :cond_3
    return v3

    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public static getNoteBitmap()Landroid/graphics/Bitmap;
    .locals 5

    .line 1971
    sget v0, Lcom/flyersoft/tools/A;->noteImg:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1972
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 1973
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->note_1:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    .line 1974
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    return-object v0

    .line 1976
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->noteImg:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 1977
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    .line 1978
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->note_2:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    .line 1979
    :cond_2
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    return-object v0

    .line 1981
    :cond_3
    sget v0, Lcom/flyersoft/tools/A;->noteImg:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/note_img.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1982
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    if-nez v0, :cond_4

    .line 1983
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-static {v0, v2, v1, v1}, Lcom/flyersoft/tools/A;->getFileBitmap(Landroid/content/Context;Ljava/io/File;II)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    .line 1984
    :cond_4
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5

    return-object v0

    .line 1987
    :cond_5
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->colorValue(I)I

    move-result v0

    const/16 v1, 0xc8

    if-le v0, v1, :cond_7

    .line 1988
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm2:Landroid/graphics/Bitmap;

    if-nez v0, :cond_6

    .line 1989
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->note_0_2:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm2:Landroid/graphics/Bitmap;

    .line 1990
    :cond_6
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm2:Landroid/graphics/Bitmap;

    return-object v0

    .line 1992
    :cond_7
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    if-nez v0, :cond_8

    .line 1993
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->note_0_1:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    .line 1994
    :cond_8
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->noteBm:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static getSpanLine(I)Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;
    .locals 3

    .line 1087
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 1088
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    .line 1089
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;

    .line 1090
    iget v2, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    if-ne v2, p0, :cond_1

    return-object v1

    .line 1092
    :cond_2
    new-instance v0, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;

    invoke-direct {v0}, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;-><init>()V

    .line 1093
    iput p0, v0, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->line:I

    .line 1094
    sget-object p0, Lcom/flyersoft/staticlayout/MRTextView;->mrSpanLines:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private getTextRealHeight(II)I
    .locals 3

    .line 1851
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    .line 1852
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1853
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v1

    const-class v2, Landroid/text/style/CharacterStyle;

    invoke-interface {v1, p1, p2, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/text/style/CharacterStyle;

    .line 1854
    array-length p2, p1

    if-lez p2, :cond_0

    .line 1855
    new-instance p2, Landroid/text/TextPaint;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    move-object v0, p2

    .line 1856
    :cond_0
    array-length p2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_1

    aget-object v2, p1, v1

    .line 1857
    invoke-direct {p0, v0, v2}, Lcom/flyersoft/staticlayout/MRTextView;->updateState(Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 1860
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result p1

    int-to-float p1, p1

    iget p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingMult:F

    mul-float p1, p1, p2

    iget p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingAdd:F

    add-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private getTextXOriginal(II)F
    .locals 7

    .line 2273
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 2274
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHoriCssMargin(II)F

    move-result v1

    .line 2275
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphBegin(Ljava/lang/CharSequence;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2276
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v2

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    add-float/2addr v1, v2

    :cond_0
    const/4 v2, 0x0

    cmpg-float v3, v1, v2

    if-gez v3, :cond_1

    const/4 v1, 0x0

    .line 2279
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2

    const/4 v5, 0x4

    if-ne v3, v5, :cond_4

    .line 2281
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTextPureWidth(I)F

    move-result v6

    sub-float/2addr v5, v6

    if-ne v3, v4, :cond_3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v5, v3

    :cond_3
    add-float/2addr v1, v5

    :cond_4
    if-ge p2, v0, :cond_5

    move p2, v0

    :cond_5
    if-ne v0, p2, :cond_6

    goto :goto_0

    .line 2288
    :cond_6
    invoke-direct {p0, p1, v0, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result v2

    :goto_0
    add-float/2addr v1, v2

    return v1
.end method

.method public static getWords(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1302
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    .line 1303
    invoke-static {p0, p1, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsFinal(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1304
    sget-boolean v1, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    if-eq v0, v1, :cond_0

    .line 1305
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 1306
    invoke-static {p0, p1, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsFinal(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_0
    return-void
.end method

.method public static getWordsFinal(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1311
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 1312
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 1314
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    move v2, v1

    if-nez v1, :cond_0

    :goto_1
    if-ge v2, v0, :cond_0

    .line 1318
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    if-ne v2, v0, :cond_1

    return-void

    .line 1321
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/staticlayout/MRTextView;->isSplitChar(C)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_7

    :cond_2
    :goto_2
    add-int/lit8 v3, v2, 0x1

    if-ge v3, v0, :cond_9

    .line 1323
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getType(C)I

    move-result v5

    const/4 v6, 0x5

    if-ne v5, v6, :cond_3

    .line 1324
    sget-boolean v7, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    if-eqz v7, :cond_3

    goto :goto_3

    :cond_3
    const/16 v7, 0x10

    const/4 v8, 0x7

    const/4 v9, 0x6

    const/16 v10, 0x8

    if-ne v5, v10, :cond_5

    .line 1327
    sput-boolean v4, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    add-int/lit8 v2, v2, 0x2

    if-ne v2, v0, :cond_4

    goto :goto_5

    .line 1330
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    if-eq v3, v6, :cond_2

    if-eq v3, v9, :cond_2

    if-eq v3, v8, :cond_2

    if-eq v3, v10, :cond_2

    if-eq v3, v7, :cond_2

    const/16 v5, 0x18

    if-ne v3, v5, :cond_8

    goto :goto_2

    :cond_5
    if-eq v5, v9, :cond_6

    if-eq v5, v8, :cond_6

    if-ne v5, v7, :cond_9

    .line 1337
    :cond_6
    sput-boolean v4, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    :goto_3
    move v2, v3

    goto :goto_2

    :cond_7
    :goto_4
    add-int/2addr v2, v4

    if-ge v2, v0, :cond_8

    .line 1343
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v3

    if-nez v3, :cond_8

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/flyersoft/staticlayout/MRTextView;->isSplitChar(C)Z

    move-result v3

    if-nez v3, :cond_8

    goto :goto_4

    :cond_8
    :goto_5
    move v3, v2

    .line 1344
    :cond_9
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1352
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v1, v3

    :goto_6
    if-ge v1, v0, :cond_a

    .line 1354
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v4

    if-eqz v4, :cond_a

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_a
    if-ne v3, v1, :cond_b

    goto :goto_7

    .line 1356
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_7
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method private hasItalic([Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 2823
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 2824
    instance-of v4, v3, Lcom/flyersoft/staticlayout/MyStyleSpan;

    if-eqz v4, :cond_0

    .line 2825
    check-cast v3, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MyStyleSpan;->getStyle()I

    move-result v3

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private inPixelAutoScroll()Z
    .locals 2

    .line 732
    sget-boolean v0, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-eqz v0, :cond_1

    .line 733
    sget v0, Lcom/flyersoft/tools/A;->autoScrollMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->autoScrollMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private initCurrentViewObjs()V
    .locals 4

    .line 84
    sget-boolean v0, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 85
    sput-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->vertOld:Z

    .line 86
    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 87
    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    sget-object v2, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->getType(C)I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getType(C)I

    move-result v0

    if-le v0, v2, :cond_1

    .line 89
    :cond_0
    sput-boolean v3, Lcom/flyersoft/staticlayout/MRTextView;->vertOld:Z

    :cond_1
    return-void
.end method

.method private initIfHasRuby()V
    .locals 5

    .line 2580
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->rubyInited:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 2582
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->rubyInited:Z

    .line 2583
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2585
    invoke-interface {v1}, Landroid/text/Spanned;->length()I

    move-result v2

    const-class v3, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    const/4 v4, 0x0

    invoke-interface {v1, v4, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    if-eqz v2, :cond_1

    .line 2586
    array-length v2, v2

    if-lez v2, :cond_1

    .line 2587
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasRuby:Z

    .line 2588
    :cond_1
    invoke-interface {v1}, Landroid/text/Spanned;->length()I

    move-result v2

    const-class v3, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    invoke-interface {v1, v4, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    if-eqz v1, :cond_2

    .line 2589
    array-length v1, v1

    if-lez v1, :cond_2

    .line 2590
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasEmphasis:Z

    :cond_2
    :goto_0
    return-void
.end method

.method private isFloatText([Ljava/lang/Object;II)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 419
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 420
    instance-of v4, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v4, :cond_0

    .line 421
    check-cast v3, Lcom/flyersoft/staticlayout/MyFloatSpan;

    iget v4, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    if-ne v4, p2, :cond_0

    iget v3, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    if-ne v3, p3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private isParagraphBegin(Ljava/lang/CharSequence;I)Z
    .locals 2

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    .line 427
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge p2, v1, :cond_0

    sub-int/2addr p2, v0

    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    const/16 p2, 0xa

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    return v0
.end method

.method private isParagraphEnd(Ljava/lang/CharSequence;II)Z
    .locals 2

    .line 581
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-lt p2, v0, :cond_0

    return v1

    :cond_0
    if-ltz p3, :cond_1

    .line 583
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p2

    if-ge p3, p2, :cond_1

    invoke-interface {p1, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    const/16 v0, 0xa

    if-ne p2, v0, :cond_1

    return v1

    .line 585
    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-ne p3, p1, :cond_2

    return v1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private isRtf(I)Z
    .locals 1

    .line 2170
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private isSpecialLine(Landroid/graphics/Canvas;FFLandroid/text/TextPaint;ILjava/lang/String;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)Z
    .locals 8

    .line 591
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lez v2, :cond_0

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {p6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v5, 0xa

    if-ne v2, v5, :cond_0

    .line 592
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {p6, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p6

    .line 594
    :goto_0
    const-string v2, "\u2500\u2500\u2500"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 595
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v0

    .line 596
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, p4}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    const/high16 v3, 0x3f800000    # 1.0f

    .line 597
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 598
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    const/16 v5, -0x96

    invoke-static {v3, v5}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v3, 0x0

    cmpl-float v5, p2, v3

    if-lez v5, :cond_1

    .line 599
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth()F

    move-result v5

    cmpl-float v5, p2, v5

    if-eqz v5, :cond_2

    invoke-virtual {p0, p5}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_1

    goto :goto_1

    :cond_1
    move v3, p2

    .line 601
    :cond_2
    :goto_1
    iget v6, p7, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpg-float v6, v3, v6

    if-gez v6, :cond_3

    .line 602
    iget v3, p7, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 603
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v6

    int-to-float v6, v6

    iget v1, p7, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v6, v1

    .line 604
    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    sub-float v0, p3, v0

    move v1, v0

    move-object p2, p1

    move p4, v0

    move p6, v1

    move-object p7, v2

    move p3, v3

    move p5, v6

    invoke-virtual/range {p2 .. p7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return v4

    :cond_4
    return v3
.end method

.method public static isSplitChar(C)Z
    .locals 1

    .line 1188
    invoke-static {p0}, Ljava/lang/Character;->getType(C)I

    move-result p0

    const/4 v0, 0x5

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private lineHasRuby(I)Z
    .locals 3

    .line 561
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasRuby:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasEmphasis:Z

    if-nez v0, :cond_0

    return v1

    .line 563
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v2, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 564
    array-length v0, v0

    if-lez v0, :cond_1

    return v2

    .line 566
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyHtml$Emphasis;

    if-eqz p1, :cond_2

    .line 567
    array-length p1, p1

    if-lez p1, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method private lineHasUnheritedSize(I)Z
    .locals 6

    .line 2107
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2108
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    .line 2110
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v1, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 2111
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v3, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-static {v0, v3}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyStyleSpan;

    .line 2112
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v0, v4

    .line 2113
    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MyStyleSpan;->getStyle()I

    move-result v5

    and-int/2addr v5, v2

    if-ne v5, v2, :cond_1

    .line 2114
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2119
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-static {v0, v3}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2120
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    invoke-static {v0, v3}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    .line 2121
    array-length v3, v0

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_4

    aget-object v5, v0, v4

    .line 2122
    iget-boolean v5, v5, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    if-nez v5, :cond_3

    .line 2123
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2128
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1
.end method

.method private mrSpansOverflow(Ljava/util/ArrayList;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MRTextView$MRSpan;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 899
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_4

    .line 900
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v5, v5, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    cmpl-float v2, v2, v5

    if-ltz v2, :cond_0

    .line 901
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isBlankChar(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isBlankChar(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    return v3

    .line 903
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    if-ge v1, v2, :cond_1

    .line 904
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    add-int/lit8 v5, v1, 0x2

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v6, v6, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    cmpl-float v2, v2, v6

    if-ltz v2, :cond_1

    .line 905
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isBlankChar(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    return v3

    .line 907
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    if-gt v1, v2, :cond_3

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isBlankChar(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 908
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->width:F

    const/4 v5, 0x0

    cmpl-float v2, v2, v5

    if-nez v2, :cond_2

    .line 909
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v5, v5, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget-object v6, v6, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    invoke-static {v5, v6}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v5

    iput v5, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->width:F

    .line 910
    :cond_2
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->width:F

    add-float/2addr v2, v1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v5

    add-float/2addr v1, v5

    cmpl-float v1, v2, v1

    if-lez v1, :cond_3

    return v3

    :cond_3
    move v1, v4

    goto/16 :goto_0

    :cond_4
    return v0
.end method

.method private oneLineTagHeight(I)I
    .locals 1

    .line 1006
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->alone:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result p1

    int-to-float p1, p1

    invoke-static {}, Lcom/flyersoft/tools/A;->oneLineTag()F

    move-result v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1

    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/A;->oneLineTagHeight(I)I

    move-result p1

    return p1
.end method

.method private rectF(FFFFZLandroid/graphics/Paint;)Landroid/graphics/RectF;
    .locals 1

    if-eqz p5, :cond_0

    sub-float/2addr p4, p2

    const/high16 p5, 0x41400000    # 12.0f

    div-float p5, p4, p5

    add-float/2addr p2, p5

    add-float/2addr p4, p2

    const v0, 0x3fb33333    # 1.4f

    mul-float p5, p5, v0

    sub-float/2addr p4, p5

    sub-float/2addr p3, p1

    const/high16 p5, 0x41000000    # 8.0f

    div-float/2addr p3, p5

    add-float/2addr p3, p1

    const/16 p5, 0xb4

    .line 1844
    invoke-virtual {p6, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_0

    :cond_0
    const/16 p5, 0xf0

    .line 1846
    invoke-virtual {p6, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1847
    :goto_0
    new-instance p5, Landroid/graphics/RectF;

    invoke-direct {p5, p1, p2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p5
.end method

.method private resetFontColorIfSameAsBackground(Landroid/text/TextPaint;Landroid/text/Spanned;[Ljava/lang/Object;[Lcom/flyersoft/components/CSS$BackgroundColorSpan;)V
    .locals 2

    if-nez p2, :cond_0

    goto :goto_1

    .line 449
    :cond_0
    sget-boolean p2, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-nez p2, :cond_4

    invoke-virtual {p1}, Landroid/text/TextPaint;->getColor()I

    move-result p2

    sget v0, Lcom/flyersoft/tools/A;->backgroundColor:I

    if-ne p2, v0, :cond_4

    if-eqz p4, :cond_1

    .line 450
    array-length p2, p4

    if-lez p2, :cond_1

    goto :goto_1

    .line 452
    :cond_1
    const-class p2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {p3, p2}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 453
    array-length p3, p2

    const/4 p4, 0x0

    :goto_0
    if-ge p4, p3, :cond_3

    aget-object v0, p2, p4

    .line 454
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-eqz v1, :cond_2

    iget-object v0, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 456
    :cond_3
    invoke-virtual {p1}, Landroid/text/TextPaint;->getColor()I

    move-result p2

    sget p3, Lcom/flyersoft/tools/A;->fontColor:I

    if-eq p2, p3, :cond_4

    .line 457
    sget p2, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setColor(I)V

    :cond_4
    :goto_1
    return-void
.end method

.method private rtrim(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1181
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 1182
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1183
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    return-object p1

    :cond_2
    const/4 v1, 0x0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private shouldIgnoreBorder(IIII)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p4, p1, :cond_0

    .line 1010
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v1

    sub-int/2addr v1, v0

    if-eq p1, v1, :cond_2

    :cond_0
    if-lez p4, :cond_2

    if-gt p4, p1, :cond_2

    .line 1012
    invoke-virtual {p0, p4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result p1

    .line 1013
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    .line 1014
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    div-int/lit8 p3, p3, 0x3

    goto :goto_0

    :cond_1
    div-int/lit8 p3, p3, 0x2

    :goto_0
    if-le p4, v1, :cond_2

    add-int/2addr p2, p3

    if-le p1, p2, :cond_2

    return v0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private updateState(Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;)V
    .locals 1

    .line 2349
    instance-of v0, p2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    if-eqz v0, :cond_1

    .line 2350
    move-object v0, p2

    check-cast v0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    iget-boolean v0, v0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    if-eqz v0, :cond_0

    .line 2351
    invoke-virtual {p2, p1}, Landroid/text/style/CharacterStyle;->updateDrawState(Landroid/text/TextPaint;)V

    return-void

    .line 2353
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    check-cast p2, Landroid/text/style/RelativeSizeSpan;

    invoke-virtual {p2}, Landroid/text/style/RelativeSizeSpan;->getSizeChange()F

    move-result p2

    mul-float v0, v0, p2

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    return-void

    .line 2355
    :cond_1
    invoke-virtual {p2, p1}, Landroid/text/style/CharacterStyle;->updateDrawState(Landroid/text/TextPaint;)V

    return-void
.end method

.method private vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    .locals 6

    if-ne p3, p4, :cond_0

    return-void

    .line 742
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v0, :cond_1

    .line 743
    invoke-interface {p2, p3, p4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v3, p5

    move v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V

    return-void

    .line 745
    :cond_1
    invoke-virtual/range {p1 .. p7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V
    .locals 15

    move-object/from16 v1, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p5

    .line 750
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_6

    .line 752
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v0, :cond_c

    .line 753
    invoke-virtual {v7}, Landroid/text/TextPaint;->isUnderlineText()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v7}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    move-object v4, v0

    goto :goto_0

    :cond_1
    move-object v4, v7

    .line 755
    :goto_0
    const-string v0, "\u4e00"

    invoke-static {v0, v7}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v5

    const/high16 v0, 0x41100000    # 9.0f

    mul-float v0, v0, v5

    const/high16 v8, 0x41200000    # 10.0f

    div-float v9, v0, v8

    add-float v0, p3, v9

    const/high16 v2, 0x40400000    # 3.0f

    div-float v2, v5, v2

    add-float v10, p4, v2

    const/4 v2, 0x0

    move v11, v0

    const/4 v12, 0x0

    .line 758
    :goto_1
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v12, v0, :cond_b

    .line 759
    invoke-virtual {v6, v12}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 760
    invoke-static {v2}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/16 v3, 0x20

    .line 761
    const-string v13, ""

    if-eq v2, v3, :cond_a

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    const v3, 0xff21

    if-lt v2, v3, :cond_a

    const v3, 0xff3a

    if-gt v2, v3, :cond_a

    :cond_2
    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    const v3, 0xff41

    if-lt v2, v3, :cond_a

    const v3, 0xff5a

    if-gt v2, v3, :cond_a

    :cond_3
    const/16 v3, 0x9

    if-ne v0, v3, :cond_4

    const v0, 0xff10

    if-lt v2, v0, :cond_a

    const v0, 0xff19

    if-le v2, v0, :cond_4

    goto/16 :goto_4

    :cond_4
    const/16 v0, 0x2e

    const/high16 v3, 0x40000000    # 2.0f

    if-eq v2, v0, :cond_5

    const/16 v0, 0x5f

    if-ne v2, v0, :cond_6

    :cond_5
    if-lez v12, :cond_6

    add-int/lit8 v0, v12, -0x1

    .line 765
    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MRTextView;->isSplitChar(C)Z

    move-result v0

    if-nez v0, :cond_6

    .line 766
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sub-float v2, v11, v9

    mul-float v3, v3, v5

    div-float/2addr v3, v8

    add-float v3, p4, v3

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_6
    const/16 v0, 0x30fc

    if-eq v2, v0, :cond_8

    const/16 v0, 0x2500

    if-eq v2, v0, :cond_8

    const v0, 0xff5e

    if-eq v2, v0, :cond_8

    const/16 v0, 0x2015

    if-eq v2, v0, :cond_8

    const/16 v0, 0x300c

    if-eq v2, v0, :cond_8

    const/16 v0, 0x300d

    if-eq v2, v0, :cond_8

    const/16 v0, 0x300e

    if-eq v2, v0, :cond_8

    const/16 v0, 0x300f

    if-eq v2, v0, :cond_8

    const v0, 0xff3b

    if-eq v2, v0, :cond_8

    const v0, 0xff3d

    if-eq v2, v0, :cond_8

    const/16 v0, 0x3010

    if-eq v2, v0, :cond_8

    const/16 v0, 0x3011

    if-eq v2, v0, :cond_8

    const/16 v0, 0x3014

    if-eq v2, v0, :cond_8

    const/16 v0, 0x3015

    if-eq v2, v0, :cond_8

    const/16 v0, 0x301d

    if-eq v2, v0, :cond_8

    const/16 v0, 0x301f

    if-eq v2, v0, :cond_8

    const v0, 0xff1d

    if-eq v2, v0, :cond_8

    const/16 v0, 0x2f

    if-eq v2, v0, :cond_8

    const/16 v0, 0x3d

    if-ne v2, v0, :cond_7

    goto :goto_2

    .line 773
    :cond_7
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    .line 774
    invoke-virtual {v3, v11, v10}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v0, 0x42c80000    # 100.0f

    sub-float v0, v10, v0

    .line 775
    invoke-virtual {v3, v11, v0}, Landroid/graphics/Path;->lineTo(FF)V

    const/16 v0, 0x3000

    if-eq v2, v0, :cond_9

    move-object v0, p0

    .line 777
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MRTextView;->drawVerticalChar(Landroid/graphics/Canvas;CLandroid/graphics/Path;Landroid/text/TextPaint;F)V

    goto :goto_3

    .line 771
    :cond_8
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sub-float v2, v11, v9

    mul-float v3, v3, v5

    div-float/2addr v3, v8

    add-float v3, p4, v3

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_9
    :goto_3
    add-float/2addr v11, v5

    goto :goto_5

    .line 762
    :cond_a
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sub-float v3, v11, v9

    const/high16 v14, 0x40c00000    # 6.0f

    div-float v14, v5, v14

    add-float v14, p4, v14

    invoke-virtual {v1, v0, v3, v14, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 763
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v7}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    add-float/2addr v11, v0

    :goto_5
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_1

    :cond_b
    :goto_6
    return-void

    .line 783
    :cond_c
    invoke-virtual/range {p1 .. p5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public appendEmptyLines(I)V
    .locals 6

    if-gtz p1, :cond_0

    goto/16 :goto_0

    .line 2686
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    instance-of v0, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    if-nez v0, :cond_1

    goto/16 :goto_0

    .line 2689
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    .line 2690
    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    const/4 v2, 0x1

    if-nez v1, :cond_2

    .line 2691
    iget v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    .line 2692
    :cond_2
    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    .line 2694
    iget p1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    .line 2695
    iget v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    mul-int p1, p1, v1

    .line 2696
    iget v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mColumns:I

    add-int/2addr p1, v1

    add-int/lit8 p1, p1, 0x2

    .line 2697
    invoke-static {p1}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealIntArraySize(I)I

    move-result p1

    .line 2698
    iget-object v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    array-length v1, v1

    if-le p1, v1, :cond_3

    .line 2699
    new-array v1, p1, [I

    .line 2700
    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    iget-object v4, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    array-length v4, v4

    const/4 v5, 0x0

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2701
    iput-object v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLines:[I

    .line 2702
    new-array p1, p1, [Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 2703
    iget-object v1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    iget-object v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    array-length v3, v3

    invoke-static {v1, v5, p1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2704
    iput-object p1, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineDirections:[Lcom/flyersoft/staticlayout/MyLayout$Directions;

    .line 2707
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result p1

    .line 2708
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result v1

    .line 2709
    iget v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineStart(II)V

    .line 2710
    iget v3, v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->mLineCount:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    mul-int v4, v4, p1

    add-int/2addr v4, v1

    .line 2711
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v5

    if-eqz v5, :cond_4

    mul-int/lit8 p1, p1, 0x5

    :cond_4
    add-int/2addr v4, p1

    .line 2710
    invoke-virtual {v0, v3, v4}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->setLineTop(II)V

    .line 2713
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getHeight()I

    move-result p1

    sub-int/2addr p1, v1

    .line 2714
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getBottom()I

    move-result v0

    add-int/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    .line 2717
    :try_start_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1d

    if-lt p1, v0, :cond_5

    .line 2718
    iget p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->setBottom(I)V

    .line 2719
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result p1

    if-eqz p1, :cond_6

    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_6

    .line 2720
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setBottom(I)V

    return-void

    .line 2722
    :cond_5
    const-class p1, Landroid/view/View;

    const-string v0, "mBottom"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 2723
    invoke-virtual {p1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 2724
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2725
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_6

    .line 2726
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2729
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_6
    :goto_0
    return-void
.end method

.method public buildDrawingCache(Z)V
    .locals 0

    .line 68
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->destroyDrawingCache()V

    return-void
.end method

.method public clearLrCache()V
    .locals 2

    .line 2542
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2543
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->highlightLines:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2544
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 2545
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 2546
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 2547
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2548
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHashPaints:Ljava/util/Map;

    if-eqz v0, :cond_6

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 2549
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineUnherited:Ljava/util/Map;

    if-eqz v0, :cond_7

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 2550
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    if-eqz v0, :cond_8

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 2551
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineTextPureWidth:Ljava/util/Map;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_9
    const/4 v0, 0x0

    .line 2552
    sput-object v0, Lcom/flyersoft/components/CSS;->em2:Ljava/lang/Float;

    const/4 v0, 0x0

    .line 2553
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHeight2:I

    .line 2554
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    .line 2555
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    const/4 v1, 0x0

    .line 2556
    iput v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicIgnoreWidth:F

    .line 2557
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->layoutState:I

    .line 2558
    const-string v0, "\u4e00"

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth:F

    return-void
.end method

.method public drawHyphenSep(Lcom/flyersoft/staticlayout/MyLayout;ILjava/lang/String;FFLandroid/text/TextPaint;Landroid/graphics/Canvas;I)Z
    .locals 7

    .line 1447
    invoke-virtual {p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineSep(I)I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_4

    .line 1448
    invoke-virtual {p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineSep(I)I

    move-result p1

    if-lez p1, :cond_4

    const/4 v0, 0x1

    if-eqz p3, :cond_0

    .line 1449
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {p3, v2}, Ljava/lang/String;->charAt(I)C

    move-result p3

    if-eq p1, p3, :cond_4

    .line 1450
    :cond_0
    sget-boolean p3, Lcom/flyersoft/tools/A;->textJustified:Z

    if-nez p3, :cond_3

    if-gt p8, v0, :cond_3

    .line 1451
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result p3

    if-lez p3, :cond_2

    .line 1452
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-interface {p4}, Ljava/lang/CharSequence;->length()I

    move-result p4

    if-ge p3, p4, :cond_2

    .line 1453
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-interface {p4, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p4

    if-eq p4, p1, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p4

    add-int/lit8 p8, p3, -0x1

    invoke-interface {p4, p8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p4

    if-ne p4, p1, :cond_2

    :cond_1
    return v1

    .line 1455
    :cond_2
    invoke-virtual {p0, p2, p3}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX(II)F

    move-result p4

    :cond_3
    move v4, p4

    .line 1458
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, ""

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move v5, p5

    move-object v6, p6

    move-object v2, p7

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V

    return v0

    :cond_4
    return v1
.end method

.method public drawVerticalChar(Landroid/graphics/Canvas;CLandroid/graphics/Path;Landroid/text/TextPaint;F)V
    .locals 16

    move/from16 v0, p2

    move/from16 v1, p5

    const/16 v2, 0x201c

    const/16 v3, 0x7c

    const v4, 0xfe41

    const v5, 0xfe40

    const v6, 0xfe3f

    if-eq v0, v2, :cond_12

    const/16 v2, 0x2018

    if-eq v0, v2, :cond_12

    const/16 v2, 0x301d

    if-eq v0, v2, :cond_12

    const/16 v2, 0x300c

    if-eq v0, v2, :cond_12

    const/16 v2, 0x300e

    if-eq v0, v2, :cond_12

    if-ne v0, v4, :cond_0

    goto/16 :goto_5

    :cond_0
    const/16 v2, 0x201d

    const v4, 0xfe42

    if-eq v0, v2, :cond_11

    const/16 v2, 0x2019

    if-eq v0, v2, :cond_11

    const/16 v2, 0x301e

    if-eq v0, v2, :cond_11

    const/16 v2, 0x300d

    if-eq v0, v2, :cond_11

    const/16 v2, 0x300f

    if-eq v0, v2, :cond_11

    if-ne v0, v4, :cond_1

    goto/16 :goto_4

    :cond_1
    const/16 v2, 0x28

    if-eq v0, v2, :cond_10

    const v2, 0xfe5d

    if-eq v0, v2, :cond_10

    const v2, 0xff08

    if-ne v0, v2, :cond_2

    goto/16 :goto_3

    :cond_2
    const/16 v2, 0x29

    if-eq v0, v2, :cond_f

    const v2, 0xfe5e

    if-eq v0, v2, :cond_f

    const v2, 0xff09

    if-ne v0, v2, :cond_3

    goto/16 :goto_2

    :cond_3
    const/16 v2, 0x7b

    if-ne v0, v2, :cond_4

    const v0, 0xfe37

    goto/16 :goto_6

    :cond_4
    const/16 v2, 0x7d

    if-ne v0, v2, :cond_5

    const v0, 0xfe38

    goto :goto_6

    :cond_5
    const/16 v2, 0x5b

    if-ne v0, v2, :cond_6

    const v0, 0xfe39

    goto :goto_6

    :cond_6
    const/16 v2, 0x5d

    if-ne v0, v2, :cond_7

    const v0, 0xfe3a

    goto :goto_6

    :cond_7
    const/16 v2, 0x3c

    if-eq v0, v2, :cond_e

    if-ne v0, v6, :cond_8

    goto :goto_1

    :cond_8
    const/16 v2, 0x3e

    if-eq v0, v2, :cond_d

    if-ne v0, v5, :cond_9

    goto :goto_0

    :cond_9
    const/16 v2, 0x300a

    if-ne v0, v2, :cond_a

    const v0, 0xfe3d

    goto :goto_6

    :cond_a
    const/16 v2, 0x300b

    if-ne v0, v2, :cond_b

    const v0, 0xfe3e

    goto :goto_6

    :cond_b
    const/16 v2, 0x2026

    if-eq v0, v2, :cond_c

    const/16 v2, 0x2014

    if-eq v0, v2, :cond_c

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_c

    const/16 v2, 0x5f

    if-ne v0, v2, :cond_13

    :cond_c
    const/16 v0, 0x7c

    goto :goto_6

    :cond_d
    :goto_0
    const v0, 0xfe40

    goto :goto_6

    :cond_e
    :goto_1
    const v0, 0xfe3f

    goto :goto_6

    :cond_f
    :goto_2
    const v0, 0xfe36

    goto :goto_6

    :cond_10
    :goto_3
    const v0, 0xfe35

    goto :goto_6

    :cond_11
    :goto_4
    const v0, 0xfe42

    goto :goto_6

    :cond_12
    :goto_5
    const v0, 0xfe41

    .line 2415
    :cond_13
    :goto_6
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-lt v2, v4, :cond_14

    const/4 v2, 0x1

    goto :goto_7

    :cond_14
    const/4 v2, 0x0

    .line 2418
    :goto_7
    sget-boolean v4, Lcom/flyersoft/staticlayout/MRTextView;->vertOld:Z

    const/4 v7, 0x0

    if-nez v4, :cond_16

    if-nez v2, :cond_15

    goto :goto_8

    :cond_15
    const/4 v11, 0x0

    const/4 v12, 0x0

    goto/16 :goto_1e

    :cond_16
    :goto_8
    const/16 v8, 0x2c

    const v9, 0x3f266666    # 0.65f

    const v10, 0x3f0ccccd    # 0.55f

    const v11, 0x3f19999a    # 0.6f

    const/high16 v12, 0x3f000000    # 0.5f

    if-eq v0, v8, :cond_18

    const/16 v8, 0x2e

    if-ne v0, v8, :cond_17

    goto :goto_9

    :cond_17
    const/4 v8, 0x0

    const/4 v13, 0x0

    goto :goto_b

    :cond_18
    :goto_9
    if-eqz v2, :cond_19

    mul-float v8, v1, v11

    goto :goto_a

    :cond_19
    if-eqz v4, :cond_1a

    mul-float v8, v1, v9

    goto :goto_a

    :cond_1a
    mul-float v8, v1, v10

    :goto_a
    neg-float v13, v1

    if-eqz v2, :cond_1b

    mul-float v13, v13, v12

    goto :goto_b

    :cond_1b
    const v14, 0x3f333333    # 0.7f

    mul-float v13, v13, v14

    :goto_b
    const/16 v14, 0x3002

    const v15, 0x3ee66666    # 0.45f

    if-ne v0, v14, :cond_1f

    if-eqz v2, :cond_1c

    mul-float v8, v1, v10

    goto :goto_c

    :cond_1c
    if-eqz v4, :cond_1d

    mul-float v8, v1, v12

    goto :goto_c

    :cond_1d
    const v8, 0x3f28f5c3    # 0.66f

    mul-float v8, v8, v1

    :goto_c
    neg-float v10, v1

    if-eqz v2, :cond_1e

    mul-float v10, v10, v15

    goto :goto_d

    :cond_1e
    mul-float v10, v10, v11

    :goto_d
    move v13, v10

    :cond_1f
    const v10, 0xff0c

    const v14, 0x3ea8f5c3    # 0.33f

    if-eq v0, v10, :cond_36

    const v10, 0xfe50

    if-eq v0, v10, :cond_36

    const/16 v10, 0x3001

    if-eq v0, v10, :cond_36

    const v10, 0xfe51

    if-eq v0, v10, :cond_36

    const/16 v10, 0xb8

    if-ne v0, v10, :cond_20

    goto/16 :goto_1a

    :cond_20
    const/16 v10, 0x21

    const v11, 0x3e4ccccd    # 0.2f

    if-ne v0, v10, :cond_22

    if-eqz v2, :cond_21

    const v3, 0x3ef5c28f    # 0.48f

    mul-float v3, v3, v1

    move v7, v3

    goto :goto_e

    :cond_21
    const v7, 0x3ee66666    # 0.45f

    :goto_e
    neg-float v1, v1

    if-eqz v2, :cond_35

    const v2, 0x3d4ccccd    # 0.05f

    mul-float v1, v1, v2

    goto/16 :goto_1d

    :cond_22
    const/16 v10, 0x3a

    if-eq v0, v10, :cond_33

    const/16 v10, 0x3b

    if-ne v0, v10, :cond_23

    goto/16 :goto_18

    :cond_23
    const v9, 0xfe55

    const/high16 v10, 0x3e800000    # 0.25f

    if-eq v0, v9, :cond_2f

    const v9, 0xfe54

    if-eq v0, v9, :cond_2f

    const v9, 0xff1a

    if-eq v0, v9, :cond_2f

    const v9, 0xff1b

    if-eq v0, v9, :cond_2f

    const/16 v9, 0x60

    if-ne v0, v9, :cond_24

    goto :goto_15

    :cond_24
    const v9, 0xff1f

    if-eq v0, v9, :cond_2d

    const/16 v9, 0x3f

    if-eq v0, v9, :cond_2d

    const v9, 0xff01

    if-ne v0, v9, :cond_25

    goto :goto_12

    :cond_25
    const v9, 0xfe56

    if-eq v0, v9, :cond_2b

    const v9, 0xfe30

    if-ne v0, v9, :cond_26

    goto :goto_10

    :cond_26
    if-ne v0, v6, :cond_28

    if-eqz v2, :cond_27

    goto :goto_13

    :cond_27
    mul-float v1, v1, v14

    :goto_f
    move v7, v1

    goto :goto_13

    :cond_28
    if-ne v0, v5, :cond_29

    if-eqz v2, :cond_27

    goto :goto_13

    :cond_29
    if-ne v0, v3, :cond_2a

    mul-float v7, v1, v10

    goto :goto_13

    :cond_2a
    move v11, v8

    goto :goto_14

    :cond_2b
    :goto_10
    if-eqz v4, :cond_2c

    mul-float v3, v1, v10

    goto :goto_11

    :cond_2c
    const/4 v3, 0x0

    :goto_11
    if-eqz v2, :cond_32

    neg-float v1, v1

    const v2, 0x3dcccccd    # 0.1f

    goto :goto_17

    :cond_2d
    :goto_12
    if-eqz v4, :cond_2e

    const v2, 0x3e99999a    # 0.3f

    mul-float v1, v1, v2

    goto :goto_f

    :cond_2e
    mul-float v1, v1, v10

    goto :goto_f

    :goto_13
    move v11, v7

    :goto_14
    move v12, v13

    goto :goto_1e

    :cond_2f
    :goto_15
    if-eqz v2, :cond_30

    mul-float v3, v1, v10

    goto :goto_16

    :cond_30
    if-eqz v4, :cond_31

    mul-float v3, v1, v12

    goto :goto_16

    :cond_31
    mul-float v3, v1, v14

    :goto_16
    if-eqz v2, :cond_32

    neg-float v1, v1

    const v2, 0x3e19999a    # 0.15f

    :goto_17
    mul-float v1, v1, v2

    move v7, v1

    :cond_32
    move v11, v3

    move v12, v7

    goto :goto_1e

    :cond_33
    :goto_18
    if-eqz v2, :cond_34

    const v2, 0x3ecccccd    # 0.4f

    mul-float v2, v2, v1

    move v7, v2

    goto :goto_19

    :cond_34
    const v7, 0x3f266666    # 0.65f

    :goto_19
    neg-float v1, v1

    :cond_35
    mul-float v1, v1, v11

    goto :goto_1d

    :cond_36
    :goto_1a
    if-eqz v2, :cond_37

    const v3, 0x3e6147ae    # 0.22f

    mul-float v3, v3, v1

    :goto_1b
    move v7, v3

    goto :goto_1c

    :cond_37
    if-eqz v4, :cond_38

    mul-float v3, v1, v12

    goto :goto_1b

    :cond_38
    mul-float v3, v1, v14

    goto :goto_1b

    :goto_1c
    neg-float v1, v1

    if-eqz v2, :cond_35

    mul-float v1, v1, v15

    :goto_1d
    move v12, v1

    move v11, v7

    .line 2450
    :goto_1e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v8, p1

    move-object/from16 v10, p3

    move-object/from16 v13, p4

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;
    .locals 11

    .line 1906
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1907
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    return-object p1

    .line 1909
    :cond_0
    new-instance v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/staticlayout/MRTextView$MarginF;-><init>(Lcom/flyersoft/staticlayout/MRTextView;FFFFF)V

    .line 1910
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth()F

    move-result v2

    iput v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    .line 1912
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2

    if-nez v2, :cond_1

    return-object v0

    .line 1915
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v2

    const-class v3, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 1917
    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x0

    if-ge v4, v3, :cond_6

    aget-object v7, v2, v4

    .line 1918
    iget v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    iget v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v10

    mul-float v9, v9, v10

    add-float/2addr v8, v9

    iput v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 1919
    iget v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->top:F

    iget v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v10

    mul-float v9, v9, v10

    add-float/2addr v8, v9

    iput v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->top:F

    .line 1920
    iget v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    iget v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v10

    mul-float v9, v9, v10

    add-float/2addr v8, v9

    iput v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    .line 1921
    iget v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->bottom:F

    iget v9, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v10

    mul-float v9, v9, v10

    add-float/2addr v8, v9

    iput v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->bottom:F

    .line 1923
    iget v8, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    cmpl-float v6, v8, v6

    if-eqz v6, :cond_3

    .line 1924
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indentSp:Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eqz v6, :cond_2

    iget v6, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget-object v8, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indentSp:Lcom/flyersoft/staticlayout/MyMarginSpan;

    iget v8, v8, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-le v6, v8, :cond_3

    .line 1925
    :cond_2
    iput-object v7, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indentSp:Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 1926
    iget v6, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->indent:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM2()F

    move-result v8

    mul-float v6, v6, v8

    iput v6, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    .line 1929
    :cond_3
    iget-boolean v6, v7, Lcom/flyersoft/staticlayout/MyMarginSpan;->noindent:Z

    if-nez v6, :cond_4

    instance-of v6, v7, Lcom/flyersoft/staticlayout/MyBulletSpan;

    if-eqz v6, :cond_5

    :cond_4
    const/4 v5, 0x1

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    if-eqz v5, :cond_7

    .line 1932
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indentSp:Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-nez v2, :cond_7

    .line 1933
    iput v6, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    .line 1935
    :cond_7
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v2

    int-to-float v2, v2

    cmpl-float v3, v2, v6

    if-ltz v3, :cond_8

    .line 1937
    iget v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    add-float/2addr v3, v2

    iput v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    goto :goto_1

    .line 1939
    :cond_8
    iget v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v3, v2

    iput v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    .line 1941
    :goto_1
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpl-float v2, v2, v6

    if-lez v2, :cond_9

    .line 1942
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3f266666    # 0.65f

    mul-float v2, v2, v3

    float-to-int v2, v2

    .line 1943
    iget v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    int-to-float v2, v2

    cmpl-float v3, v3, v2

    if-lez v3, :cond_9

    .line 1944
    iput v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 1946
    :cond_9
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v2, v2, v6

    if-lez v2, :cond_a

    .line 1947
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3eb33333    # 0.35f

    mul-float v2, v2, v3

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v2, v2, v3

    const/high16 v3, 0x40800000    # 4.0f

    div-float/2addr v2, v3

    float-to-int v2, v2

    .line 1948
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    .line 1949
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    add-float/2addr v2, v4

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_a

    .line 1950
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    sub-float/2addr v3, v2

    iput v3, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    .line 1954
    :cond_a
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpg-float v2, v2, v6

    if-gez v2, :cond_b

    .line 1955
    iput v6, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 1956
    :cond_b
    iget v2, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpg-float v2, v2, v6

    if-gez v2, :cond_c

    .line 1957
    iput v6, v0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    .line 1959
    :cond_c
    iget-object v2, v1, Lcom/flyersoft/staticlayout/MRTextView;->lineMargins:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getCurPosition()I
    .locals 3

    .line 1060
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    return v0
.end method

.method public getFromOriginalPaint(Landroid/text/TextPaint;)Landroid/text/TextPaint;
    .locals 1

    .line 1170
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, p1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 1171
    sget-boolean p1, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eqz p1, :cond_0

    .line 1172
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getPaintSkew(Landroid/graphics/Paint;)F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 1173
    :cond_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->fontBold:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 1174
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    :cond_1
    return-object v0
.end method

.method public getHoriCssMargin(II)F
    .locals 1

    .line 1881
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object p1

    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 1884
    iget p1, p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    neg-float p1, p1

    return p1

    :cond_0
    const/4 v0, 0x3

    if-ne p2, v0, :cond_1

    .line 1886
    iget p2, p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    iget v0, p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    iget p1, p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    add-float/2addr v0, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v0, p1

    sub-float/2addr p2, v0

    return p2

    .line 1888
    :cond_1
    iget p1, p1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    return p1
.end method

.method public getIgnoreBorderTop(I)I
    .locals 5

    .line 936
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    const/4 v1, -0x1

    if-lt p1, v0, :cond_0

    return v1

    .line 938
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v0

    const-class v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-nez v0, :cond_1

    return v1

    .line 943
    :cond_1
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-ltz v2, :cond_3

    .line 944
    aget-object v3, v0, v2

    .line 945
    iget-object v4, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-eqz v4, :cond_2

    iget-object v4, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v4}, Lcom/flyersoft/components/CSS;->hasBorderOrBackgroundColor(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_4

    .line 952
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget v2, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v0

    if-eq v0, p1, :cond_4

    .line 953
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    iget v0, v3, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result p1

    return p1

    :cond_4
    return v1
.end method

.method public getInLineHeight(Landroid/graphics/Paint;)I
    .locals 1

    .line 1864
    new-instance v0, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    .line 1865
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 1866
    iget p1, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int p1, p1

    return p1
.end method

.method public getItalicIgnoreWidth()F
    .locals 2

    .line 1467
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicIgnoreWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 1468
    const-string v0, "A"

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicIgnoreWidth:F

    .line 1469
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->italicIgnoreWidth:F

    return v0
.end method

.method public getLastBorderTopLine(I)I
    .locals 6

    .line 959
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    if-eqz v0, :cond_0

    .line 960
    iget p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    return p1

    .line 961
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    return v1

    .line 963
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v0, :cond_a

    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->inPixelAutoScroll()Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_1

    .line 966
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPageBreakLine()I

    move-result v0

    if-eq v0, v1, :cond_3

    return v0

    .line 970
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    .line 971
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v2

    if-ne p1, v1, :cond_5

    .line 973
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    add-int v3, v0, v2

    add-int/lit8 v4, v3, -0x1

    invoke-virtual {p1, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p1

    .line 974
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v4

    if-lt p1, v4, :cond_4

    return v1

    :cond_4
    if-lez p1, :cond_5

    .line 976
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v4

    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->oneLineTagHeight(I)I

    move-result v5

    sub-int/2addr v3, v5

    if-le v4, v3, :cond_5

    add-int/lit8 p1, p1, -0x1

    :cond_5
    add-int/lit8 v3, p1, 0x1

    .line 981
    invoke-virtual {p0, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop(I)I

    move-result v4

    add-int v5, v0, v2

    if-ge v4, v5, :cond_6

    .line 982
    invoke-virtual {p0, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getIgnoreBorderTop(I)I

    move-result v4

    if-eq v4, p1, :cond_7

    if-ne v4, v3, :cond_6

    goto :goto_0

    :cond_6
    const/4 v4, -0x1

    :cond_7
    :goto_0
    if-ne v4, v1, :cond_8

    .line 988
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getIgnoreBorderTop(I)I

    move-result v4

    .line 989
    invoke-direct {p0, p1, v0, v2, v4}, Lcom/flyersoft/staticlayout/MRTextView;->shouldIgnoreBorder(IIII)Z

    move-result v5

    if-eqz v5, :cond_9

    return v4

    :cond_8
    move v1, v4

    .line 995
    :cond_9
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v4

    if-eqz v4, :cond_a

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v3

    if-eqz v3, :cond_a

    .line 996
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloatSp(I)Lcom/flyersoft/staticlayout/MyFloatSpan;

    move-result-object v3

    .line 997
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    iget v3, v3, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    invoke-virtual {v4, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v3

    .line 998
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->shouldIgnoreBorder(IIII)Z

    move-result p1

    if-eqz p1, :cond_a

    return v3

    :cond_a
    :goto_1
    return v1
.end method

.method public getLayout()Lcom/flyersoft/staticlayout/MyLayout;
    .locals 1

    .line 2373
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 2374
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    return-object v0

    .line 2375
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    return-object v0
.end method

.method public getLineAlign(I)I
    .locals 4

    .line 1154
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1156
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1157
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    .line 1158
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-nez v0, :cond_2

    return v1

    .line 1161
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 1162
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v1

    .line 1163
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v3

    invoke-static {v2, v3, v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getAlignmentSpan([Ljava/lang/Object;Landroid/text/Spanned;II)Lcom/flyersoft/staticlayout/AlignmentSpan;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getAlign(Lcom/flyersoft/staticlayout/AlignmentSpan;)I

    move-result v0

    .line 1165
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineAligns:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method public getLineHeight()I
    .locals 8

    .line 2479
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 2480
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v0

    return v0

    .line 2481
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    if-lez v0, :cond_1

    return v0

    .line 2485
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 2487
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_6

    sub-int/2addr v1, v2

    :goto_0
    if-lez v1, :cond_6

    add-int/lit8 v3, v1, -0x1

    .line 2490
    invoke-virtual {v0, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v4

    .line 2491
    invoke-virtual {v0, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v5

    sub-int/2addr v5, v4

    const/4 v4, 0x4

    if-le v5, v4, :cond_5

    .line 2493
    invoke-virtual {p0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_3

    .line 2494
    array-length v6, v4

    if-nez v6, :cond_2

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v6, 0x1

    :goto_2
    if-nez v6, :cond_4

    .line 2495
    sget-boolean v7, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v7, :cond_4

    if-eqz v4, :cond_4

    .line 2496
    array-length v7, v4

    if-ne v7, v2, :cond_4

    aget-object v4, v4, v5

    instance-of v4, v4, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    if-eqz v4, :cond_4

    const/4 v6, 0x1

    :cond_4
    if-eqz v6, :cond_5

    .line 2499
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v4

    .line 2500
    invoke-virtual {v0, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v3

    if-le v4, v3, :cond_5

    sub-int/2addr v4, v3

    .line 2502
    iput v4, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :cond_5
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 2511
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2512
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight2:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    .line 2515
    :cond_6
    :goto_3
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    if-nez v0, :cond_7

    .line 2516
    invoke-super {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLineHeight()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    .line 2517
    :cond_7
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mLineHeight2:I

    return v0
.end method

.method public getLineHeight(I)I
    .locals 2

    .line 2529
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 2531
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v1

    sub-int/2addr v0, v1

    if-lez p1, :cond_0

    .line 2533
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTopAdded(I)I

    move-result p1

    sub-int/2addr v0, p1

    :cond_0
    if-lez v0, :cond_1

    return v0

    .line 2534
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 2536
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2538
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result p1

    return p1
.end method

.method public getLineHeight2()I
    .locals 1

    .line 2523
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHeight2:I

    if-nez v0, :cond_0

    .line 2524
    invoke-super {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLineHeight()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHeight2:I

    .line 2525
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineHeight2:I

    return v0
.end method

.method public getLineOffset(IF)I
    .locals 5

    .line 2174
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v0

    const/4 v1, -0x1

    if-lt p1, v0, :cond_0

    return v1

    .line 2178
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 2179
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v2

    .line 2180
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->selfDrawLine(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2181
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getMyOffset(IF)I

    move-result v3

    if-eq v3, v1, :cond_1

    add-int/2addr v0, v3

    return v0

    .line 2186
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphBegin(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2187
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v1

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    sub-float/2addr p2, v1

    .line 2189
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v1

    if-lez v1, :cond_3

    int-to-float v1, v1

    sub-float/2addr p2, v1

    .line 2193
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getOffsetForHorizontal(IF)I

    move-result v1

    add-int/lit8 v3, v2, -0x1

    if-ne v1, v3, :cond_4

    add-int/lit8 v3, v1, 0x1

    .line 2195
    invoke-direct {p0, p1, v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result v3

    const/high16 v4, 0x40400000    # 3.0f

    div-float/2addr v3, v4

    .line 2196
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v4

    iget v4, v4, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-float/2addr v4, p1

    add-float/2addr v4, v3

    cmpl-float p1, p2, v4

    if-lez p1, :cond_4

    return v2

    :cond_4
    return v1

    :catch_0
    move-exception p1

    .line 2203
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x1

    .line 2204
    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "-getLineOffset error, not finish measure?"

    const/4 v0, 0x0

    aput-object p2, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return v0
.end method

.method public getLineRecord(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;
    .locals 2

    .line 2007
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 2008
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    .line 2009
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2010
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    return-object p1

    .line 2012
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineRecord2(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v0

    .line 2013
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lrCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getLineRecord2(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;
    .locals 16

    move-object/from16 v0, p0

    move/from16 v2, p1

    .line 2019
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v7, 0x0

    if-le v2, v1, :cond_0

    return-object v7

    .line 2022
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v8

    .line 2023
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v1

    if-ge v8, v1, :cond_f

    .line 2024
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-le v1, v3, :cond_1

    goto/16 :goto_7

    .line 2027
    :cond_1
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3, v8, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "\t"

    const-string v4, " "

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 2028
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    return-object v7

    .line 2031
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v3

    const/4 v4, 0x3

    const/4 v9, 0x0

    if-eq v3, v4, :cond_b

    const/4 v5, 0x4

    if-ne v3, v5, :cond_3

    goto/16 :goto_4

    .line 2060
    :cond_3
    const-string v4, "\n"

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    return-object v7

    .line 2063
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->selfDrawLine(I)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 2064
    invoke-virtual/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v4

    .line 2065
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-direct {v0, v5, v8}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphBegin(Ljava/lang/CharSequence;I)Z

    move-result v5

    if-eqz v5, :cond_5

    iget v5, v4, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    goto :goto_0

    :cond_5
    const/4 v5, 0x0

    .line 2067
    :goto_0
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getHoriCssMargin(II)F

    move-result v3

    add-float v10, v3, v5

    .line 2069
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v3

    int-to-float v3, v3

    iget v6, v4, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    sub-float/2addr v3, v6

    iget v4, v4, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v3, v4

    sub-float v5, v3, v5

    .line 2071
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 2072
    invoke-virtual/range {v0 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineWords(Ljava/lang/String;IZLjava/util/ArrayList;FZ)Ljava/util/ArrayList;

    move-result-object v1

    .line 2074
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_a

    .line 2075
    new-instance v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    invoke-direct {v3, v0}, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;-><init>(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 2077
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 2078
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_1

    .line 2079
    :cond_6
    new-array v5, v6, [F

    iput-object v5, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    .line 2080
    new-array v5, v6, [F

    iput-object v5, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 2083
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_9

    .line 2084
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 2086
    :goto_3
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v11, v13, :cond_8

    .line 2088
    iget-object v13, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Float;

    invoke-virtual {v14}, Ljava/lang/Float;->floatValue()F

    move-result v14

    add-float/2addr v14, v10

    int-to-float v12, v12

    add-float/2addr v14, v12

    aput v14, v13, v6

    if-lez v6, :cond_7

    .line 2089
    iget-object v13, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v13, v13, v6

    iget-object v14, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    add-int/lit8 v15, v6, -0x1

    aget v14, v14, v15

    cmpg-float v13, v13, v14

    if-gez v13, :cond_7

    .line 2090
    iget-object v13, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    aget v13, v13, v15

    iget-object v14, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v14, v14, v6

    sub-float/2addr v13, v14

    .line 2091
    iget-object v14, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget v15, v14, v6

    add-float/2addr v15, v13

    aput v15, v14, v6

    add-float/2addr v10, v13

    :cond_7
    add-int v13, v8, v6

    add-int/lit8 v14, v13, 0x1

    .line 2094
    invoke-direct {v0, v2, v13, v14}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result v13

    add-float/2addr v12, v13

    float-to-int v12, v12

    .line 2095
    iget-object v13, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Float;

    invoke-virtual {v14}, Ljava/lang/Float;->floatValue()F

    move-result v14

    add-float/2addr v14, v10

    int-to-float v15, v12

    add-float/2addr v14, v15

    aput v14, v13, v6

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2099
    :cond_9
    invoke-direct {v0, v3, v2}, Lcom/flyersoft/staticlayout/MRTextView;->checkLineRecordDir(Lcom/flyersoft/staticlayout/MRTextView$LineRecord;I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v1

    return-object v1

    :cond_a
    return-object v7

    .line 2034
    :cond_b
    :goto_4
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineMax(I)F

    move-result v6

    sub-float/2addr v5, v6

    if-ne v3, v4, :cond_c

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v5, v4

    .line 2038
    :cond_c
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getHoriCssMargin(II)F

    move-result v3

    add-float/2addr v5, v3

    .line 2041
    new-instance v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    invoke-direct {v3, v0}, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;-><init>(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 2042
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2043
    new-array v6, v4, [F

    iput-object v6, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    .line 2044
    new-array v4, v4, [F

    iput-object v4, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    .line 2047
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasUnheritedSize(I)Z

    move-result v4

    const/4 v6, 0x0

    .line 2048
    :goto_5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v9, v7, :cond_e

    .line 2050
    iget-object v7, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    int-to-float v6, v6

    add-float v10, v5, v6

    aput v10, v7, v9

    if-eqz v4, :cond_d

    add-int v7, v8, v9

    add-int/lit8 v10, v7, 0x1

    .line 2052
    invoke-direct {v0, v2, v7, v10}, Lcom/flyersoft/staticlayout/MRTextView;->getDesiredWidth(III)F

    move-result v7

    goto :goto_6

    .line 2054
    :cond_d
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    add-int v10, v8, v9

    add-int/lit8 v11, v10, 0x1

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v12

    invoke-static {v7, v10, v11, v12}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v7

    :goto_6
    add-float/2addr v6, v7

    float-to-int v6, v6

    .line 2055
    iget-object v7, v3, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    int-to-float v10, v6

    add-float/2addr v10, v5

    aput v10, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 2057
    :cond_e
    invoke-direct {v0, v3, v2}, Lcom/flyersoft/staticlayout/MRTextView;->checkLineRecordDir(Lcom/flyersoft/staticlayout/MRTextView$LineRecord;I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v1

    return-object v1

    :cond_f
    :goto_7
    return-object v7
.end method

.method public getLineSpans(I)[Ljava/lang/Object;
    .locals 4

    if-ltz p1, :cond_2

    .line 2247
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2250
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2251
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    return-object p1

    .line 2253
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 2254
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v1

    .line 2256
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2

    const-class v3, Ljava/lang/Object;

    invoke-interface {v2, v0, v1, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    .line 2257
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getLineText(I)Ljava/lang/String;
    .locals 2

    .line 2455
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 2456
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result p1

    if-gez v0, :cond_0

    const/4 v0, 0x0

    .line 2459
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le p1, v1, :cond_1

    .line 2460
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    .line 2461
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 2463
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2464
    const-string p1, ""

    return-object p1
.end method

.method public getLineTop(I)I
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2621
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result p1

    return p1
.end method

.method public getLineTop2(I)I
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 2628
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v1

    .line 2629
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTopAdded2(I)I

    move-result v2

    add-int/2addr v1, v2

    .line 2630
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineTopBorderSp(I)Lcom/flyersoft/staticlayout/MyMarginSpan;

    move-result-object v2

    if-eqz v2, :cond_1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    .line 2631
    invoke-static {v2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    .line 2632
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasRuby(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2633
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result p1

    sget-boolean v2, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v2, :cond_2

    const/16 v2, 0x17

    goto :goto_0

    :cond_2
    const/16 v2, 0x19

    :goto_0
    mul-int p1, p1, v2

    div-int/lit8 p1, p1, 0x64
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sub-int/2addr v1, p1

    :cond_3
    return v1

    :catch_0
    move-exception p1

    .line 2636
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v0
.end method

.method public getLineTop3(I)I
    .locals 2

    .line 2642
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    .line 2643
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTopAdded(I)I

    move-result p1

    add-int/2addr v0, p1

    return v0
.end method

.method public getLineTop3WithRuby(I)I
    .locals 2

    .line 2648
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v0

    .line 2649
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasRuby(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2650
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result p1

    sget-boolean v1, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x17

    goto :goto_0

    :cond_0
    const/16 v1, 0x19

    :goto_0
    mul-int p1, p1, v1

    div-int/lit8 p1, p1, 0x64

    sub-int/2addr v0, p1

    :cond_1
    return v0
.end method

.method public getLineWords(Ljava/lang/String;IZLjava/util/ArrayList;FZ)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;FZ)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p4

    const/4 v2, -0x1

    if-eqz p6, :cond_0

    if-eq p2, v2, :cond_0

    .line 1194
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/staticlayout/MyLayout;->words:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    return-object v3

    .line 1199
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    if-eqz p3, :cond_1

    .line 1201
    :try_start_0
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/staticlayout/MRTextView;->rtrim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1202
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_10

    const-string v4, "\n"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto/16 :goto_7

    .line 1207
    :cond_2
    sget-boolean v4, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v4, :cond_7

    const/4 v4, 0x0

    .line 1208
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v4, v8, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v8

    if-eqz v8, :cond_3

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1210
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v4, v8, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v7

    :cond_4
    add-int/2addr v4, v7

    .line 1211
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v8, v4

    .line 1212
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v8, v9, :cond_5

    .line 1213
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_6

    .line 1216
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    .line 1217
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v8}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v9

    add-float v10, v5, v9

    .line 1219
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1220
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-le v9, v7, :cond_8

    .line 1221
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    new-array v11, v9, [F

    .line 1222
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v8, p1, v4, v12, v11}, Landroid/text/TextPaint;->getTextWidths(Ljava/lang/String;II[F)I

    const/4 v4, 0x0

    :goto_2
    if-ge v4, v9, :cond_8

    .line 1224
    aget v8, v11, v4

    add-float/2addr v10, v8

    .line 1225
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_6
    if-eqz p6, :cond_11

    .line 1296
    :goto_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/staticlayout/MyLayout;->words:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v3

    :cond_7
    const/4 v10, 0x0

    :cond_8
    if-eqz v0, :cond_b

    .line 1234
    :try_start_1
    sget-boolean v4, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-nez v4, :cond_9

    if-eq p2, v2, :cond_9

    .line 1235
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1236
    invoke-static {p1, v3, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWords(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1238
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p1

    const/4 v4, 0x0

    const/4 v10, 0x0

    .line 1239
    :goto_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_9

    .line 1240
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1241
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v9, p1

    .line 1242
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v12

    invoke-static {v11, v9, v8, v12}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v8

    add-float/2addr v10, v8

    .line 1244
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    :cond_9
    cmpl-float p1, p5, v5

    if-lez p1, :cond_a

    sub-float p1, p5, v10

    .line 1249
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v7

    int-to-float v2, v2

    div-float/2addr p1, v2

    .line 1250
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 1251
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v0, v6, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1252
    :goto_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v7, v4, :cond_a

    .line 1253
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    int-to-float v5, v7

    mul-float v5, v5, p1

    add-float/2addr v5, v2

    .line 1254
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v0, v7, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-float/2addr v2, v4

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    :cond_a
    if-eqz p6, :cond_11

    goto/16 :goto_3

    .line 1263
    :cond_b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1264
    invoke-static {p1, v3, v0}, Lcom/flyersoft/staticlayout/MRTextView;->getWords(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1266
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v0, :cond_f

    if-eq p2, v2, :cond_f

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_f

    .line 1267
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    .line 1268
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v7

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1269
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v7

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1271
    invoke-virtual {v0, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineSep(I)I

    move-result v8

    if-lez v8, :cond_e

    .line 1272
    sget-object v8, Lcom/flyersoft/staticlayout/MRTextView;->HYPH_RIGHT_PUNCS1:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-eq v8, v2, :cond_c

    .line 1273
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v7

    invoke-virtual {v4, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->setLineSep(II)V

    .line 1274
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v7

    invoke-virtual {v4, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, p1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6

    .line 1275
    :cond_c
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v4, v8

    invoke-interface {v2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v4, 0x20

    const-string v8, "######error hyph draw, ignore:"

    if-ne v2, v4, :cond_d

    .line 1276
    :try_start_2
    invoke-virtual {v0, p2}, Lcom/flyersoft/staticlayout/MyLayout;->removeLineSep(I)V

    .line 1277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v7, [Ljava/lang/Object;

    aput-object p1, v0, v6

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_6

    .line 1278
    :cond_d
    invoke-static {v5}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isConnectChar(C)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1279
    invoke-virtual {v0, p2}, Lcom/flyersoft/staticlayout/MyLayout;->removeLineSep(I)V

    .line 1280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v7, [Ljava/lang/Object;

    aput-object p1, v0, v6

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_6

    .line 1282
    :cond_e
    sget-object p1, Lcom/flyersoft/staticlayout/MRTextView;->HYPH_RIGHT_PUNCS2:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-eq p1, v2, :cond_f

    .line 1284
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v7

    invoke-virtual {v4, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->setLineSep(II)V

    .line 1285
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v7

    invoke-virtual {v4, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, p1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_f
    :goto_6
    if-eqz p6, :cond_11

    goto/16 :goto_3

    :cond_10
    :goto_7
    if-eqz p6, :cond_11

    goto/16 :goto_3

    :cond_11
    return-object v3

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_8

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1291
    :try_start_3
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1292
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p6, :cond_12

    .line 1296
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/staticlayout/MyLayout;->words:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    return-object p1

    :goto_8
    if-eqz p6, :cond_13

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/staticlayout/MyLayout;->words:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1297
    :cond_13
    throw p1
.end method

.method public getPageBreakLine()I
    .locals 9

    .line 1022
    sget-boolean v0, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 1024
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-nez v0, :cond_1

    goto/16 :goto_3

    .line 1027
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    .line 1028
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v2

    .line 1029
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v4

    add-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v3

    .line 1030
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v4

    .line 1031
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v3

    .line 1032
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v5

    const-class v6, Lcom/flyersoft/components/CSS$PAGE_BREAK;

    invoke-interface {v5, v4, v3, v6}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/flyersoft/components/CSS$PAGE_BREAK;

    .line 1033
    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_6

    aget-object v6, v3, v5

    .line 1034
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v7

    invoke-interface {v7, v6}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v6

    .line 1035
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 1036
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0xa

    if-le v6, v7, :cond_2

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-static {v7, v6, v8}, Lcom/flyersoft/tools/A;->isEmtpyText(Ljava/lang/CharSequence;II)Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_2

    .line 1038
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v6

    .line 1039
    invoke-virtual {p0, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result v7

    sub-int/2addr v7, v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v8

    if-ge v7, v8, :cond_3

    invoke-virtual {p0, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result v7

    sub-int/2addr v7, v0

    invoke-virtual {p0, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v8

    if-lt v7, v8, :cond_5

    :cond_3
    if-le v6, v2, :cond_5

    move v7, v2

    :goto_1
    if-ge v7, v6, :cond_5

    .line 1042
    invoke-virtual {p0, v7}, Lcom/flyersoft/staticlayout/MRTextView;->getLineText(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_4

    return v6

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    :goto_3
    return v1
.end method

.method public getPaintExtra(Landroid/graphics/Paint;)I
    .locals 4

    .line 1870
    new-instance v0, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    .line 1871
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 1872
    iget p1, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingMult:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v0, v1

    mul-float p1, p1, v0

    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingAdd:F

    add-float/2addr p1, v0

    float-to-double v0, p1

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    add-double/2addr v0, v2

    double-to-int p1, v0

    return p1
.end method

.method public getRealHeight()I
    .locals 2

    .line 2669
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 2670
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v0

    return v0

    .line 2671
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    return v0
.end method

.method public getRealLineCount()I
    .locals 2

    .line 2663
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 2664
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v0

    return v0

    .line 2665
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    sub-int/2addr v0, v1

    return v0
.end method

.method public getScrollView()Landroid/view/View;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->scrollView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->scrollView:Landroid/view/View;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->scrollView:Landroid/view/View;

    return-object v0
.end method

.method public getSpanned()Landroid/text/Spanned;
    .locals 2

    .line 2771
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2773
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    instance-of v0, v0, Landroid/text/Spanned;

    if-eqz v0, :cond_1

    .line 2774
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Spanned;

    return-object v0

    :cond_1
    return-object v1
.end method

.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .line 2614
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 2615
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    .line 2616
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getText2()Ljava/lang/String;
    .locals 1

    .line 2656
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->pureText:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 2657
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->pureText:Ljava/lang/String;

    .line 2658
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->pureText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextX(II)F
    .locals 2

    .line 2264
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    if-nez v0, :cond_0

    .line 2265
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->selfDrawLine(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2266
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getTextX2(II)F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    :goto_0
    cmpl-float v1, v0, v1

    if-nez v1, :cond_1

    .line 2268
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/staticlayout/MRTextView;->getTextXOriginal(II)F

    move-result p1

    return p1

    :cond_1
    return v0
.end method

.method public getTextX2(II)F
    .locals 3

    .line 2359
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineRecord(I)Lcom/flyersoft/staticlayout/MRTextView$LineRecord;

    move-result-object v0

    const/high16 v1, -0x40800000    # -1.0f

    if-eqz v0, :cond_2

    .line 2361
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p1

    sub-int/2addr p2, p1

    if-gez p2, :cond_0

    return v1

    .line 2365
    :cond_0
    iget-object p1, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    array-length p1, p1

    if-ge p2, p1, :cond_1

    .line 2366
    iget-object p1, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->starts:[F

    aget p1, p1, p2

    return p1

    :cond_1
    iget-object p2, v0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->ends:[F

    add-int/lit8 p1, p1, -0x1

    aget p1, p2, p1

    return p1

    :cond_2
    return v1
.end method

.method public getTxtHeight()I
    .locals 3

    .line 78
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int/2addr v1, v0

    return v1
.end method

.method public getWidth2()I
    .locals 3

    .line 1473
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v0, :cond_1

    .line 1474
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mInnerWidth:I

    if-nez v0, :cond_0

    .line 1476
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const-string v1, "?"

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    :cond_0
    return v0

    .line 1479
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v0

    return v0
.end method

.method public getWordSizes(ILjava/util/ArrayList;FLandroid/text/TextPaint;Z)[F
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;F",
            "Landroid/text/TextPaint;",
            "Z)[F"
        }
    .end annotation

    .line 1367
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/staticlayout/MyLayout;->sizes:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    if-eqz v0, :cond_0

    return-object v0

    .line 1371
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [F

    const/high16 v1, -0x40800000    # -1.0f

    .line 1372
    invoke-virtual {p0, p2, v0, p4, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F

    move-result v1

    .line 1374
    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    const/high16 v2, 0x42480000    # 50.0f

    mul-float v2, v2, p3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v2, v4

    cmpg-float v2, v1, v2

    if-gez v2, :cond_1

    .line 1375
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v3

    :cond_1
    const/4 v2, 0x0

    const/4 v4, 0x1

    if-eqz p5, :cond_7

    const p5, 0x3c23d70a    # 0.01f

    mul-float p5, p5, p3

    sub-float v5, v1, p5

    cmpg-float v5, p3, v5

    if-gez v5, :cond_2

    .line 1383
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "+getWordsLength() ERROR:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " off:"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " word:"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v1, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    const v1, 0x3f7ae148    # 0.98f

    .line 1384
    invoke-virtual {p0, p2, v0, p4, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F

    move-result v1

    const/4 v5, 0x0

    goto :goto_0

    :cond_2
    const/4 v5, 0x1

    :goto_0
    sub-float v6, v1, p5

    cmpg-float v6, p3, v6

    if-gez v6, :cond_3

    const v1, 0x3f733333    # 0.95f

    .line 1387
    invoke-virtual {p0, p2, v0, p4, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F

    move-result v1

    :cond_3
    sub-float v6, v1, p5

    cmpg-float v6, p3, v6

    if-gez v6, :cond_4

    const v1, 0x3f666666    # 0.9f

    .line 1388
    invoke-virtual {p0, p2, v0, p4, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F

    move-result v1

    :cond_4
    sub-float v6, v1, p5

    cmpg-float v6, p3, v6

    if-gez v6, :cond_5

    const v1, 0x3f59999a    # 0.85f

    .line 1389
    invoke-virtual {p0, p2, v0, p4, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F

    move-result p4

    move v1, p4

    :cond_5
    sub-float p4, v1, p5

    cmpl-float p4, p3, p4

    if-ltz p4, :cond_6

    const/4 p4, 0x1

    goto :goto_1

    :cond_6
    const/4 p4, 0x0

    goto :goto_1

    :cond_7
    const/4 p4, 0x1

    const/4 v5, 0x1

    :goto_1
    if-eqz p4, :cond_a

    .line 1394
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    const/4 p5, 0x0

    if-le p4, v4, :cond_9

    .line 1395
    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result p4

    if-eqz p4, :cond_8

    const/4 p4, 0x0

    goto :goto_2

    :cond_8
    const/high16 p4, 0x3f800000    # 1.0f

    invoke-static {p4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p4

    :goto_2
    sub-float/2addr p3, v1

    int-to-float p4, p4

    sub-float/2addr p3, p4

    .line 1396
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    sub-int/2addr p4, v4

    int-to-float p4, p4

    div-float/2addr p3, p4

    .line 1398
    aget p4, v0, v2

    .line 1399
    aput p5, v0, v2

    .line 1400
    :goto_3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p5

    if-ge v4, p5, :cond_b

    .line 1401
    aget p5, v0, v4

    int-to-float v1, v4

    mul-float v1, v1, p3

    add-float/2addr v1, p4

    .line 1402
    aput v1, v0, v4

    add-float/2addr p4, p5

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1405
    :cond_9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_b

    .line 1406
    aput p5, v0, v2

    goto :goto_4

    :cond_a
    move-object v0, v3

    :cond_b
    :goto_4
    if-eqz v5, :cond_c

    .line 1411
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p2

    iget-object p2, p2, Lcom/flyersoft/staticlayout/MyLayout;->sizes:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    return-object v0
.end method

.method public getWordsLength(Ljava/util/ArrayList;[FLandroid/text/TextPaint;F)F
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;[F",
            "Landroid/text/TextPaint;",
            "F)F"
        }
    .end annotation

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p4, v0

    if-eqz v0, :cond_0

    .line 1419
    invoke-virtual {p3, p4}, Landroid/text/TextPaint;->setTextScaleX(F)V

    .line 1422
    :cond_0
    sget-boolean p4, Lcom/flyersoft/staticlayout/MRTextView;->hasHindi:Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p4, :cond_1

    const/4 p4, 0x0

    .line 1423
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p4, v2, :cond_4

    .line 1424
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2, p3}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v2

    aput v2, p2, p4

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 1426
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    .line 1427
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1428
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1429
    :cond_2
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    new-array v2, v2, [F

    .line 1430
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4, v2}, Landroid/text/TextPaint;->getTextWidths(Ljava/lang/String;[F)I

    const/4 p3, 0x0

    const/4 p4, 0x0

    .line 1432
    :goto_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge p3, v3, :cond_4

    .line 1433
    aput v0, p2, p3

    const/4 v3, 0x0

    .line 1434
    :goto_3
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 1435
    aget v4, p2, p3

    add-int/lit8 v5, p4, 0x1

    aget p4, v2, p4

    add-float/2addr v4, p4

    aput v4, p2, p3

    add-int/lit8 v3, v3, 0x1

    move p4, v5

    goto :goto_3

    :cond_3
    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    .line 1440
    :cond_4
    array-length p1, p2

    :goto_4
    if-ge v1, p1, :cond_5

    aget p3, p2, v1

    add-float/2addr v0, p3

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_5
    return v0
.end method

.method public hasHighlight()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public indentWidth()F
    .locals 2

    .line 2562
    sget-boolean v0, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth:F

    sget v1, Lcom/flyersoft/tools/A;->indentLength:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEmptyLine(I)Z
    .locals 2

    .line 2469
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 2470
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result p1

    .line 2471
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0, p1}, Lcom/flyersoft/tools/A;->isEmtpyText(Ljava/lang/CharSequence;II)Z

    move-result p1

    return p1
.end method

.method public isImageDrawed(I)Z
    .locals 5

    .line 918
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 921
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    .line 922
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v2

    .line 923
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v3

    if-gt v0, v3, :cond_4

    .line 924
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight2()I

    move-result v3

    add-int/2addr v2, v3

    if-ge v0, v2, :cond_1

    goto :goto_1

    .line 927
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyImageSpan;

    .line 928
    array-length v0, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    aget-object v3, p1, v2

    .line 929
    iget-boolean v3, v3, Lcom/flyersoft/staticlayout/MyImageSpan;->drawed:Z

    if-nez v3, :cond_2

    return v1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 932
    :cond_3
    array-length p1, p1

    if-lez p1, :cond_4

    const/4 p1, 0x1

    return p1

    :cond_4
    :goto_1
    return v1
.end method

.method public isItalicPaint(Landroid/text/TextPaint;)Z
    .locals 6

    .line 573
    invoke-virtual {p1}, Landroid/text/TextPaint;->getTextSkewX()F

    move-result v0

    float-to-double v0, v0

    const-wide v2, -0x4046666666666666L    # -0.1

    const/4 v4, 0x1

    cmpg-double v5, v0, v2

    if-gez v5, :cond_0

    return v4

    .line 575
    :cond_0
    invoke-virtual {p1}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result p1

    const/4 v0, 0x2

    and-int/2addr p1, v0

    if-ne p1, v0, :cond_1

    return v4

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isLastHalfLine(I)Z
    .locals 5

    .line 695
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->ignoreHighlight:Z

    const/4 v1, 0x0

    if-nez v0, :cond_5

    sget-boolean v0, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v0, :cond_5

    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->inPixelAutoScroll()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 698
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v0

    const/4 v2, 0x1

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v0

    if-lt p1, v0, :cond_1

    return v2

    .line 701
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v3

    add-int/2addr v0, v3

    .line 703
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v3, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v3

    if-ge p1, v3, :cond_2

    return v1

    .line 709
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v3

    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->oneLineTagHeight(I)I

    move-result v4

    sub-int/2addr v0, v4

    if-le v3, v0, :cond_3

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    .line 711
    :cond_3
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_4

    .line 712
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v0

    if-ne p1, v0, :cond_4

    goto :goto_0

    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 716
    iput p1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine:I

    :cond_5
    :goto_2
    return v1
.end method

.method public isNormalImageLine(I)Z
    .locals 9

    .line 2779
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2781
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne p0, v0, :cond_1

    return v1

    .line 2783
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    if-le p1, v0, :cond_2

    return v1

    .line 2785
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v0

    int-to-double v3, v0

    .line 2786
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v5

    int-to-double v5, v5

    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    mul-double v5, v5, v7

    cmpg-double v7, v3, v5

    if-gez v7, :cond_3

    return v1

    .line 2788
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasImage(I)Z

    move-result v3

    if-nez v3, :cond_4

    return v1

    .line 2790
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v3

    if-lt v0, v3, :cond_5

    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    .line 2792
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    add-int/2addr p1, v2

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result p1

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v0

    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    add-int/2addr v0, v3

    if-gt p1, v0, :cond_6

    return v1

    :cond_6
    return v2
.end method

.method public lastIgnoreLine()I
    .locals 2

    .line 722
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v0, :cond_0

    return v1

    .line 724
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    if-lez v0, :cond_1

    return v0

    .line 726
    :cond_1
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine:I

    if-lez v0, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public lineHasImage(I)Z
    .locals 3

    .line 2798
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2800
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    if-le p1, v0, :cond_1

    return v1

    .line 2802
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-nez v0, :cond_2

    return v1

    .line 2804
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyImageSpan;

    if-eqz p1, :cond_3

    .line 2805
    array-length p1, p1

    if-lez p1, :cond_3

    return v2

    :cond_3
    return v1
.end method

.method public lineIsSuperLongImage(I)Z
    .locals 5

    .line 2809
    sget-boolean v0, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2811
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLineCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    if-le p1, v0, :cond_1

    return v1

    .line 2813
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->lineHasImage(I)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    .line 2815
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v0

    .line 2816
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v3

    .line 2817
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    add-int/2addr p1, v2

    invoke-virtual {v4, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result p1

    sub-int/2addr p1, v3

    if-lt p1, v0, :cond_3

    return v2

    :cond_3
    return v1
.end method

.method public lineTopBorderSp(I)Lcom/flyersoft/staticlayout/MyMarginSpan;
    .locals 4

    .line 1051
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object p1

    const-class v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getSpans([Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eqz p1, :cond_1

    .line 1053
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1054
    iget-object v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->hasBorder(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public mrDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    .locals 27

    move-object/from16 v1, p0

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v8, p7

    .line 127
    invoke-virtual {v8}, Landroid/text/TextPaint;->isAntiAlias()Z

    move-result v0

    sget-boolean v2, Lcom/flyersoft/tools/A;->fontAnti:Z

    if-eq v0, v2, :cond_0

    .line 128
    sget-boolean v0, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v8, v0}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    :cond_0
    const/4 v13, 0x0

    .line 131
    :try_start_0
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2f

    const/4 v10, -0x1

    if-ne v1, v0, :cond_1

    :try_start_1
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v0, v0, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    if-eq v0, v10, :cond_1

    goto/16 :goto_30

    :catchall_0
    move-exception v0

    move-object/from16 v3, p2

    move/from16 v6, p5

    move/from16 v7, p6

    move v10, v4

    move v12, v5

    :goto_0
    const/16 v16, 0x0

    goto/16 :goto_2f

    :cond_1
    if-nez p2, :cond_2

    .line 134
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v11, v0

    goto :goto_1

    :cond_2
    move-object/from16 v11, p2

    .line 136
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v3

    .line 137
    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v7

    .line 138
    invoke-interface {v11, v4, v5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 139
    const-string v2, "\t"

    const-string v6, " "

    invoke-virtual {v0, v2, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 140
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3

    goto/16 :goto_30

    .line 142
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2e

    if-nez v6, :cond_4

    :try_start_3
    sget-boolean v6, Lcom/flyersoft/tools/A;->textHyphenation:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v6, :cond_5

    goto :goto_2

    :catchall_1
    move-exception v0

    move/from16 v6, p5

    move/from16 v7, p6

    move v10, v4

    move v12, v5

    move-object v3, v11

    goto :goto_0

    :cond_4
    :goto_2
    :try_start_4
    invoke-virtual {v2, v13}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/flyersoft/tools/A;->isBlankChar(C)Z

    move-result v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2e

    if-eqz v6, :cond_5

    const/4 v6, 0x1

    goto :goto_3

    :cond_5
    const/4 v6, 0x0

    :goto_3
    move-object v9, v8

    move-object v8, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move/from16 v5, p5

    .line 145
    :try_start_5
    invoke-direct/range {v1 .. v9}, Lcom/flyersoft/staticlayout/MRTextView;->adjustItalicLineX(IIIFI[Ljava/lang/Object;Ljava/lang/String;Landroid/text/TextPaint;)F

    move-result v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2d

    move v15, v3

    move v3, v2

    move-object v2, v8

    move-object v8, v9

    move v9, v15

    move v15, v4

    move v4, v6

    .line 147
    :try_start_6
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v5

    .line 148
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2c

    const/16 v16, 0x0

    .line 150
    :try_start_7
    iget v13, v1, Lcom/flyersoft/staticlayout/MRTextView;->firstDrawLine:I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2b

    if-ne v13, v10, :cond_6

    :try_start_8
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_6

    .line 151
    iput v3, v1, Lcom/flyersoft/staticlayout/MRTextView;->firstDrawLine:I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v0

    move/from16 v7, p6

    move v10, v9

    move-object v3, v11

    move v6, v12

    move v12, v15

    goto/16 :goto_2f

    .line 152
    :cond_6
    :goto_4
    :try_start_9
    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v13

    .line 153
    invoke-virtual {v6, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v14

    .line 154
    invoke-virtual {v6, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v10
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2b

    if-ne v9, v14, :cond_a

    if-eq v15, v10, :cond_8

    move-object/from16 p2, v0

    add-int/lit8 v0, v15, 0x1

    if-ne v0, v10, :cond_7

    .line 156
    :try_start_a
    invoke-interface {v11, v15}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    move-object/from16 p5, v2

    const/16 v2, 0x20

    if-eq v0, v2, :cond_9

    goto :goto_5

    :cond_7
    move-object/from16 p5, v2

    :goto_5
    invoke-interface {v11, v15}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    const/16 v2, 0xa

    if-ne v0, v2, :cond_b

    goto :goto_6

    :cond_8
    move-object/from16 p2, v0

    move-object/from16 p5, v2

    :cond_9
    :goto_6
    const/4 v0, 0x1

    goto :goto_7

    :cond_a
    move-object/from16 p2, v0

    move-object/from16 p5, v2

    :cond_b
    const/4 v0, 0x0

    .line 158
    :goto_7
    :try_start_b
    invoke-virtual {v1, v8}, Lcom/flyersoft/staticlayout/MRTextView;->getFromOriginalPaint(Landroid/text/TextPaint;)Landroid/text/TextPaint;

    move-result-object v2

    move/from16 v18, v5

    .line 159
    invoke-direct {v1, v11, v3, v10}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphEnd(Ljava/lang/CharSequence;II)Z

    move-result v5

    move-object/from16 v19, v7

    const/4 v7, 0x0

    move-object/from16 v26, v2

    move-object/from16 v2, p5

    move/from16 p5, v0

    move v0, v4

    move v4, v3

    move-object/from16 v3, v26

    move-object/from16 v26, v19

    move-object/from16 v19, v6

    move v6, v14

    move-object/from16 v14, v26

    move/from16 v26, v18

    move-object/from16 v18, v13

    move/from16 v13, v26

    .line 160
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->boldTxtChapter(Ljava/lang/String;Landroid/text/TextPaint;IZIZ)I

    move-result v6

    move/from16 v20, v5

    move-object v5, v3

    move v3, v4

    .line 162
    sget-object v4, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2b

    if-ne v1, v4, :cond_c

    const/4 v4, -0x1

    if-eq v6, v4, :cond_c

    :try_start_c
    sget-boolean v4, Lcom/flyersoft/tools/A;->txtChapterSplit:Z

    if-eqz v4, :cond_c

    sget-boolean v4, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v4, :cond_c

    sget-boolean v4, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v4, :cond_c

    sget-boolean v4, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v4, :cond_c

    .line 164
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iput v6, v0, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    return-void

    .line 167
    :cond_c
    :try_start_d
    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2b

    if-eqz v4, :cond_d

    goto/16 :goto_30

    :cond_d
    move/from16 v4, p6

    move-object v7, v2

    move v6, v3

    move v3, v12

    move-object/from16 v2, p1

    move-object v12, v5

    move-object v5, v8

    move-object/from16 v8, v18

    .line 170
    :try_start_e
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->isSpecialLine(Landroid/graphics/Canvas;FFLandroid/text/TextPaint;ILjava/lang/String;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)Z

    move-result v17
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2a

    move v2, v3

    move v3, v6

    move-object/from16 v18, v7

    if-eqz v17, :cond_e

    goto/16 :goto_30

    .line 173
    :cond_e
    :try_start_f
    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->isRtf(I)Z

    move-result v17
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_29

    if-eqz v17, :cond_10

    .line 175
    :try_start_10
    iget v4, v8, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    sub-float/2addr v2, v4

    move/from16 v4, p5

    move v5, v3

    move v6, v9

    move-object v3, v11

    move v7, v15

    move/from16 v9, p6

    move-object v11, v8

    move v15, v10

    move-object/from16 v10, p7

    move v8, v2

    move-object/from16 v2, p1

    .line 176
    :try_start_11
    invoke-direct/range {v1 .. v11}, Lcom/flyersoft/staticlayout/MRTextView;->drawRTL(Landroid/graphics/Canvas;Ljava/lang/CharSequence;ZIIIFFLandroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)Z

    move-result v21
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    move v1, v5

    move-object v5, v3

    move v3, v1

    move/from16 v22, v4

    move v1, v8

    move-object v8, v11

    if-eqz v21, :cond_f

    goto/16 :goto_30

    :cond_f
    move-object v11, v8

    move v8, v1

    goto :goto_8

    :catchall_3
    move-exception v0

    move-object v5, v3

    move v1, v8

    move/from16 v10, p3

    move/from16 v12, p4

    move/from16 v7, p6

    move v6, v1

    goto/16 :goto_2f

    :catchall_4
    move-exception v0

    move-object v5, v11

    move/from16 v10, p3

    move/from16 v12, p4

    move/from16 v7, p6

    move v6, v2

    move-object v3, v5

    goto/16 :goto_2f

    :cond_10
    move/from16 v22, p5

    move v15, v10

    move-object v5, v11

    move-object v11, v8

    move v8, v2

    .line 180
    :goto_8
    :try_start_12
    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_28

    const/16 v21, 0x0

    if-eqz v14, :cond_13

    .line 183
    :try_start_13
    array-length v1, v14

    if-lez v1, :cond_13

    .line 184
    invoke-direct/range {p0 .. p0}, Lcom/flyersoft/staticlayout/MRTextView;->initIfHasRuby()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    move-object/from16 v1, p0

    move-object/from16 v4, p1

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v9, p6

    move v10, v3

    move-object v3, v14

    move-object v14, v12

    move-object v12, v11

    move-object/from16 v11, v18

    .line 185
    :try_start_14
    invoke-direct/range {v1 .. v12}, Lcom/flyersoft/staticlayout/MRTextView;->drawRuby(Landroid/text/Spanned;[Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFILjava/lang/String;Lcom/flyersoft/staticlayout/MRTextView$MarginF;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    move v9, v8

    move-object/from16 v18, v12

    move-object v8, v4

    move v4, v6

    move-object v12, v11

    move-object v11, v5

    move v5, v7

    .line 186
    :try_start_15
    const-class v6, Lcom/flyersoft/components/CSS$BackgroundColorSpan;

    invoke-static {v3, v6}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 187
    const-class v6, Lcom/flyersoft/components/CSS$BackgroundColorSpan;

    invoke-interface {v2, v4, v5, v6}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/flyersoft/components/CSS$BackgroundColorSpan;

    move-object/from16 v21, v6

    .line 188
    :cond_11
    invoke-direct {v1, v3, v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->isFloatText([Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_12

    goto/16 :goto_30

    :cond_12
    move/from16 v6, p6

    move-object/from16 v7, p7

    .line 190
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->adjustSuperscriptSpanY(Landroid/text/Spanned;[Ljava/lang/Object;IIFLandroid/text/TextPaint;)F

    move-result v6
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    move-object v7, v2

    move-object v2, v3

    goto :goto_a

    :catchall_5
    move-exception v0

    goto :goto_9

    :catchall_6
    move-exception v0

    move-object v11, v5

    move v5, v7

    move v9, v8

    move-object v8, v4

    move v4, v6

    goto :goto_9

    :catchall_7
    move-exception v0

    move-object/from16 v1, p0

    move/from16 v4, p3

    move-object v11, v5

    move v9, v8

    move-object/from16 v8, p1

    move/from16 v5, p4

    :goto_9
    move/from16 v7, p6

    move v10, v4

    move v12, v5

    move v6, v9

    move-object v3, v11

    goto/16 :goto_2f

    :cond_13
    move-object/from16 v1, p0

    move/from16 v4, p3

    move-object v7, v2

    move v10, v3

    move v9, v8

    move-object v2, v14

    move-object/from16 v8, p1

    move-object v14, v12

    move-object/from16 v12, v18

    move-object/from16 v18, v11

    move-object v11, v5

    move/from16 v5, p4

    move/from16 v6, p6

    .line 193
    :goto_a
    :try_start_16
    invoke-static {v2, v7, v4, v5}, Lcom/flyersoft/staticlayout/MRTextView;->getAlignmentSpan([Ljava/lang/Object;Landroid/text/Spanned;II)Lcom/flyersoft/staticlayout/AlignmentSpan;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getAlign(Lcom/flyersoft/staticlayout/AlignmentSpan;)I

    move-result v3

    .line 194
    invoke-direct {v1, v8, v2, v4, v10}, Lcom/flyersoft/staticlayout/MRTextView;->drawTableZoomIcon(Landroid/graphics/Canvas;[Ljava/lang/Object;II)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_27

    const/4 v1, 0x2

    move/from16 p5, v10

    move-object v10, v2

    move-object v2, v8

    move/from16 v8, p5

    move-object/from16 p5, v11

    move-object/from16 v11, v18

    move/from16 v18, v15

    move v15, v3

    if-le v3, v1, :cond_14

    move v3, v4

    move v4, v5

    move v5, v9

    move-object/from16 v9, v21

    const/16 v21, 0x1

    goto :goto_b

    :cond_14
    move v3, v4

    move v4, v5

    move v5, v9

    move-object/from16 v9, v21

    const/16 v21, 0x0

    :goto_b
    move-object/from16 v1, p0

    .line 197
    :try_start_17
    invoke-direct/range {v1 .. v9}, Lcom/flyersoft/staticlayout/MRTextView;->drawBackgroundColorSpans(Landroid/graphics/Canvas;IIFFLandroid/text/Spanned;I[Lcom/flyersoft/components/CSS$BackgroundColorSpan;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_26

    move/from16 v23, v5

    move-object v2, v7

    move-object v3, v9

    move v9, v8

    .line 198
    :try_start_18
    invoke-direct {v1, v14, v2, v10, v3}, Lcom/flyersoft/staticlayout/MRTextView;->resetFontColorIfSameAsBackground(Landroid/text/TextPaint;Landroid/text/Spanned;[Ljava/lang/Object;[Lcom/flyersoft/components/CSS$BackgroundColorSpan;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_25

    const/high16 v8, 0x40000000    # 2.0f

    const/16 v24, 0x0

    if-eqz v21, :cond_1a

    if-eqz v22, :cond_19

    .line 202
    :try_start_19
    invoke-static {v12, v14}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    int-to-float v2, v13

    .line 203
    iget v3, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    sub-float v3, v2, v3

    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_d

    sub-float/2addr v3, v4

    const/4 v4, 0x3

    if-ne v15, v4, :cond_16

    .line 206
    :try_start_1a
    iget v2, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_9

    sub-float/2addr v3, v0

    div-float/2addr v3, v8

    add-float/2addr v2, v3

    cmpl-float v3, v2, v24

    move v7, v6

    if-lez v3, :cond_15

    move v6, v2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v3, p5

    move-object v8, v14

    move-object/from16 v2, p1

    goto :goto_c

    :cond_15
    const/4 v6, 0x0

    move-object/from16 v2, p1

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v3, p5

    move-object v8, v14

    .line 208
    :goto_c
    :try_start_1b
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_8

    move/from16 v24, v6

    move v6, v7

    move-object/from16 v14, p1

    move/from16 v2, p3

    move/from16 v25, v6

    move/from16 v6, v24

    goto :goto_f

    :catchall_8
    move-exception v0

    move v6, v7

    move/from16 v10, p3

    move/from16 v12, p4

    goto/16 :goto_29

    :catchall_9
    move-exception v0

    move-object/from16 v3, p5

    :goto_d
    move/from16 v10, p3

    goto/16 :goto_24

    :cond_16
    move-object/from16 v3, p5

    move-object v5, v14

    .line 210
    :try_start_1c
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v4, v4, v24

    if-lez v4, :cond_17

    goto :goto_e

    :cond_17
    invoke-virtual {v1, v5}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v4
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_c

    if-eqz v4, :cond_18

    :try_start_1d
    invoke-static {v8}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v24
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception v0

    goto :goto_d

    :cond_18
    const/high16 v24, 0x3f800000    # 1.0f

    :goto_e
    sub-float/2addr v2, v0

    sub-float v2, v2, v24

    .line 211
    :try_start_1e
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_c

    sub-float/2addr v2, v4

    move/from16 v4, p3

    move-object v8, v5

    move v7, v6

    move/from16 v5, p4

    move v6, v2

    move-object/from16 v2, p1

    .line 212
    :try_start_1f
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_b

    move-object v14, v2

    move v2, v4

    move/from16 v25, v7

    .line 214
    :goto_f
    :try_start_20
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-eqz v4, :cond_2d

    add-float/2addr v0, v6

    .line 215
    invoke-direct {v1, v14, v9, v6, v0}, Lcom/flyersoft/staticlayout/MRTextView;->drawUnderline(Landroid/graphics/Canvas;IFF)V

    return-void

    :catchall_b
    move-exception v0

    move-object v14, v2

    move v2, v4

    move/from16 v25, v7

    move/from16 v12, p4

    move v10, v2

    goto/16 :goto_29

    :catchall_c
    move-exception v0

    move-object/from16 v14, p1

    move/from16 v2, p3

    goto :goto_10

    :catchall_d
    move-exception v0

    move-object/from16 v14, p1

    move/from16 v2, p3

    move-object/from16 v3, p5

    :goto_10
    move/from16 v25, v6

    :goto_11
    move/from16 v12, p4

    move v10, v2

    :goto_12
    move/from16 v6, v23

    move/from16 v7, v25

    goto/16 :goto_2f

    :cond_19
    move/from16 v2, p3

    move-object/from16 v3, p5

    move/from16 v25, v6

    move-object v5, v14

    move-object/from16 v14, p1

    const/4 v4, 0x4

    if-ne v15, v4, :cond_1b

    .line 218
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float v4, v23, v4

    move/from16 v23, v4

    goto :goto_13

    :cond_1a
    move/from16 v2, p3

    move-object/from16 v3, p5

    move/from16 v25, v6

    move-object v5, v14

    move-object/from16 v14, p1

    :cond_1b
    :goto_13
    if-nez v17, :cond_28

    const/4 v4, 0x1

    if-gt v15, v4, :cond_1c

    .line 221
    iget-boolean v4, v1, Lcom/flyersoft/staticlayout/MRTextView;->selfJustified:Z
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_e

    if-nez v4, :cond_1c

    goto/16 :goto_20

    :catchall_e
    move-exception v0

    goto :goto_11

    .line 235
    :cond_1c
    :try_start_21
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 236
    invoke-direct {v1, v3, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphBegin(Ljava/lang/CharSequence;I)Z

    move-result v6
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_1e

    if-eqz v6, :cond_1d

    .line 237
    :try_start_22
    iget v6, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_e

    add-float/2addr v4, v6

    :cond_1d
    move/from16 v17, v4

    if-eqz v22, :cond_24

    if-nez v20, :cond_24

    .line 240
    :try_start_23
    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_16

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v4, 0x1

    move-object/from16 v22, v5

    const/4 v5, 0x0

    move-object/from16 v26, v22

    move-object/from16 v22, v3

    move v3, v9

    move-object/from16 v9, v26

    :try_start_24
    invoke-virtual/range {v1 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->getLineWords(Ljava/lang/String;IZLjava/util/ArrayList;FZ)Ljava/util/ArrayList;

    move-result-object v2

    .line 241
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_23

    .line 242
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v0
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_15

    if-eqz v0, :cond_1e

    :try_start_25
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getItalicIgnoreWidth()F

    move-result v0
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_f

    div-float/2addr v0, v8

    goto :goto_14

    :catchall_f
    move-exception v0

    move/from16 v10, p3

    move/from16 v12, p4

    move-object/from16 v3, v22

    goto :goto_12

    :cond_1e
    const/4 v0, 0x0

    :goto_14
    int-to-float v4, v13

    const/high16 v5, 0x40400000    # 3.0f

    mul-float v5, v5, v0

    sub-float/2addr v4, v5

    float-to-int v4, v4

    int-to-float v10, v4

    sub-float v4, v10, v17

    .line 244
    :try_start_26
    iget v5, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v4, v5

    const/4 v6, 0x1

    move v5, v3

    move-object v3, v2

    move v2, v5

    move-object v5, v9

    invoke-virtual/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->getWordSizes(ILjava/util/ArrayList;FLandroid/text/TextPaint;Z)[F

    move-result-object v7
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_15

    move v8, v2

    move-object v9, v3

    if-eqz v7, :cond_21

    const/4 v12, 0x0

    .line 246
    :goto_15
    :try_start_27
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v12, v1, :cond_20

    .line 247
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    aget v1, v7, v12
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_11

    add-float v1, v17, v1

    if-nez v12, :cond_1f

    move v2, v0

    goto :goto_16

    :cond_1f
    const/4 v2, 0x0

    :goto_16
    add-float v4, v1, v2

    move-object/from16 v1, p0

    move-object v6, v5

    move-object v2, v14

    move/from16 v5, v25

    :try_start_28
    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_10

    move-object/from16 v26, v6

    move v6, v5

    move-object/from16 v5, v26

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v14, p1

    move/from16 v25, v6

    goto :goto_15

    :catchall_10
    move-exception v0

    move v6, v5

    goto :goto_17

    :cond_20
    move/from16 v0, v17

    move/from16 v6, v25

    goto :goto_18

    :catchall_11
    move-exception v0

    move/from16 v6, v25

    :goto_17
    move/from16 v10, p3

    move/from16 v12, p4

    goto/16 :goto_27

    :cond_21
    move-object/from16 v1, p0

    move-object v6, v5

    move-object v3, v12

    move-object v2, v14

    move/from16 v4, v17

    move/from16 v5, v25

    .line 249
    :try_start_29
    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText2(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/text/TextPaint;)V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_14

    move v0, v4

    move v6, v5

    .line 250
    :goto_18
    :try_start_2a
    sget-boolean v1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v1, :cond_22

    .line 251
    iget v1, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float v5, v10, v1

    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_13

    const/4 v4, 0x0

    move-object/from16 v1, p0

    move v3, v8

    move v9, v15

    move-object/from16 v2, v19

    move-object/from16 v8, p1

    move/from16 v15, p4

    :try_start_2b
    invoke-virtual/range {v1 .. v9}, Lcom/flyersoft/staticlayout/MRTextView;->drawHyphenSep(Lcom/flyersoft/staticlayout/MyLayout;ILjava/lang/String;FFLandroid/text/TextPaint;Landroid/graphics/Canvas;I)Z
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_12

    move-object v2, v8

    goto :goto_19

    :catchall_12
    move-exception v0

    move-object v2, v8

    goto :goto_1a

    :cond_22
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v15, p4

    move v3, v8

    .line 252
    :goto_19
    :try_start_2c
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-eqz v4, :cond_2d

    .line 253
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v10, v4

    invoke-direct {v1, v2, v3, v0, v10}, Lcom/flyersoft/staticlayout/MRTextView;->drawUnderline(Landroid/graphics/Canvas;IFF)V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_17

    return-void

    :catchall_13
    move-exception v0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v15, p4

    goto :goto_1a

    :catchall_14
    move-exception v0

    move/from16 v15, p4

    move v6, v5

    goto :goto_1a

    :cond_23
    move-object v8, v12

    move-object v2, v14

    move/from16 v6, v25

    move-object v12, v9

    move v9, v15

    move/from16 v15, p4

    goto :goto_1b

    :catchall_15
    move-exception v0

    move/from16 v15, p4

    move-object v2, v14

    move/from16 v6, v25

    :goto_1a
    move/from16 v10, p3

    move v7, v6

    move v12, v15

    goto/16 :goto_28

    :catchall_16
    move-exception v0

    move/from16 v15, p4

    move-object/from16 v22, v3

    move-object v2, v14

    move/from16 v6, v25

    move/from16 v10, p3

    move v7, v6

    move v12, v15

    goto/16 :goto_29

    :cond_24
    move-object/from16 v22, v3

    move v3, v9

    move-object v8, v12

    move-object v2, v14

    move v9, v15

    move/from16 v6, v25

    move/from16 v15, p4

    move-object v12, v5

    .line 258
    :goto_1b
    :try_start_2d
    sget-boolean v4, Lcom/flyersoft/tools/A;->textHyphenation:Z
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_1d

    if-eqz v4, :cond_25

    move/from16 v4, v18

    if-ne v15, v4, :cond_25

    .line 259
    :try_start_2e
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v4

    int-to-float v4, v4

    iget v5, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float v5, v4, v5

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    move-object v4, v8

    move-object v8, v2

    move-object/from16 v2, v19

    invoke-virtual/range {v1 .. v9}, Lcom/flyersoft/staticlayout/MRTextView;->drawHyphenSep(Lcom/flyersoft/staticlayout/MyLayout;ILjava/lang/String;FFLandroid/text/TextPaint;Landroid/graphics/Canvas;I)Z
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_17

    move v9, v3

    move-object v14, v4

    goto :goto_1c

    :catchall_17
    move-exception v0

    goto :goto_1a

    :cond_25
    move v9, v3

    move-object v14, v8

    .line 261
    :goto_1c
    :try_start_2f
    sget-boolean v1, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_1c

    if-nez v1, :cond_27

    :try_start_30
    const-class v1, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {v10, v1}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_27

    if-eqz v20, :cond_26

    if-nez v21, :cond_26

    goto :goto_1e

    .line 266
    :cond_26
    invoke-static {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanLine(I)Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;

    move-result-object v7

    .line 267
    new-instance v0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;

    new-instance v4, Landroid/text/TextPaint;

    invoke-direct {v4, v12}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_1a

    move-object/from16 v1, p2

    move/from16 v5, p3

    move v3, v6

    move v6, v15

    move/from16 v2, v23

    :try_start_31
    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;-><init>(Ljava/lang/String;FFLandroid/text/TextPaint;II)V
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_19

    move v6, v3

    move v10, v5

    .line 268
    :try_start_32
    iget-object v1, v7, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_18

    return-void

    :catchall_18
    move-exception v0

    goto :goto_1d

    :catchall_19
    move-exception v0

    move v6, v3

    move v10, v5

    goto :goto_1d

    :catchall_1a
    move-exception v0

    move/from16 v10, p3

    move/from16 v2, v23

    :goto_1d
    move/from16 v12, p4

    move v7, v6

    move-object/from16 v3, v22

    move v6, v2

    goto/16 :goto_2f

    :cond_27
    :goto_1e
    move/from16 v10, p3

    move/from16 v2, v23

    add-int v4, v10, v0

    move-object/from16 v1, p0

    move/from16 v5, p4

    move v7, v6

    move-object v8, v12

    move-object/from16 v3, v22

    move v6, v2

    move-object/from16 v2, p1

    .line 262
    :try_start_33
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_1b

    move v4, v6

    move v6, v7

    move-object v5, v8

    .line 263
    :try_start_34
    sget-boolean v7, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-eqz v7, :cond_2d

    .line 264
    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    add-float/2addr v0, v4

    invoke-direct {v1, v2, v9, v4, v0}, Lcom/flyersoft/staticlayout/MRTextView;->drawUnderline(Landroid/graphics/Canvas;IFF)V

    return-void

    :catchall_1b
    move-exception v0

    move v4, v6

    move v6, v7

    move/from16 v12, p4

    goto :goto_22

    :catchall_1c
    move-exception v0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    goto :goto_1f

    :catchall_1d
    move-exception v0

    :goto_1f
    move/from16 v10, p3

    move-object/from16 v3, v22

    move/from16 v4, v23

    goto :goto_21

    :catchall_1e
    move-exception v0

    move v10, v2

    move-object v2, v14

    move/from16 v4, v23

    move/from16 v6, v25

    goto :goto_21

    :cond_28
    :goto_20
    move v10, v2

    move-object v2, v14

    move/from16 v4, v23

    move/from16 v6, v25

    move-object v14, v12

    if-eqz v17, :cond_29

    .line 223
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v7

    invoke-virtual {v7, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v7
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_1f

    int-to-float v7, v7

    add-float v23, v4, v7

    goto :goto_23

    :catchall_1f
    move-exception v0

    :goto_21
    move/from16 v12, p4

    move v7, v6

    :goto_22
    move v6, v4

    goto/16 :goto_2f

    :cond_29
    move/from16 v23, v4

    :goto_23
    cmpl-float v4, v23, v24

    if-nez v4, :cond_2a

    .line 224
    :try_start_35
    invoke-virtual {v1, v5}, Lcom/flyersoft/staticlayout/MRTextView;->isItalicPaint(Landroid/text/TextPaint;)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 225
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getItalicIgnoreWidth()F

    move-result v4
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_20

    add-float v23, v23, v4

    goto :goto_25

    :catchall_20
    move-exception v0

    :goto_24
    move/from16 v12, p4

    move v7, v6

    goto/16 :goto_29

    :cond_2a
    :goto_25
    add-int v4, v10, v0

    move-object v8, v5

    move v7, v6

    move/from16 v6, v23

    move/from16 v5, p4

    .line 226
    :try_start_36
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_24

    move-object/from16 v22, v3

    move v12, v5

    move v3, v6

    move v6, v7

    move-object v5, v8

    .line 227
    :try_start_37
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontUnderline:Z
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_23

    if-eqz v4, :cond_2b

    .line 228
    :try_start_38
    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    add-float/2addr v0, v3

    invoke-direct {v1, v2, v9, v3, v0}, Lcom/flyersoft/staticlayout/MRTextView;->drawUnderline(Landroid/graphics/Canvas;IFF)V
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_21

    goto :goto_26

    :catchall_21
    move-exception v0

    move v7, v6

    move v6, v3

    goto/16 :goto_2e

    .line 229
    :cond_2b
    :goto_26
    :try_start_39
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v0, :cond_2d

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v0

    if-ne v12, v0, :cond_2d

    int-to-float v0, v13

    .line 230
    iget v4, v11, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float v5, v0, v4

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_23

    const/4 v4, 0x0

    move-object v8, v2

    move/from16 v23, v3

    move v3, v9

    move v9, v15

    move-object/from16 v2, v19

    :try_start_3a
    invoke-virtual/range {v1 .. v9}, Lcom/flyersoft/staticlayout/MRTextView;->drawHyphenSep(Lcom/flyersoft/staticlayout/MyLayout;ILjava/lang/String;FFLandroid/text/TextPaint;Landroid/graphics/Canvas;I)Z
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_22

    return-void

    :catchall_22
    move-exception v0

    goto :goto_27

    :catchall_23
    move-exception v0

    move/from16 v23, v3

    goto :goto_27

    :catchall_24
    move-exception v0

    move-object/from16 v22, v3

    move v12, v5

    move/from16 v23, v6

    move v6, v7

    goto :goto_29

    :catchall_25
    move-exception v0

    move/from16 v10, p3

    move/from16 v12, p4

    move-object/from16 v22, p5

    goto :goto_27

    :catchall_26
    move-exception v0

    move-object/from16 v22, p5

    move v10, v3

    move v12, v4

    move/from16 v23, v5

    goto :goto_27

    :catchall_27
    move-exception v0

    move v10, v4

    move v12, v5

    move/from16 v23, v9

    move-object/from16 v22, v11

    :goto_27
    move v7, v6

    goto :goto_28

    :catchall_28
    move-exception v0

    move/from16 v10, p3

    move/from16 v12, p4

    move-object/from16 v22, v5

    move/from16 v23, v8

    move/from16 v7, p6

    :goto_28
    move-object/from16 v3, v22

    :goto_29
    move/from16 v6, v23

    goto :goto_2f

    :catchall_29
    move-exception v0

    goto :goto_2a

    :catchall_2a
    move-exception v0

    move v2, v3

    :goto_2a
    move v10, v9

    move-object/from16 v22, v11

    goto :goto_2b

    :catchall_2b
    move-exception v0

    move v10, v9

    move-object/from16 v22, v11

    move v2, v12

    :goto_2b
    move v12, v15

    goto :goto_2c

    :catchall_2c
    move-exception v0

    move v10, v9

    move-object/from16 v22, v11

    move v2, v12

    move v12, v15

    const/16 v16, 0x0

    :goto_2c
    move/from16 v7, p6

    move v6, v2

    goto :goto_2e

    :catchall_2d
    move-exception v0

    move v10, v3

    move v12, v4

    goto :goto_2d

    :catchall_2e
    move-exception v0

    move v10, v4

    move v12, v5

    :goto_2d
    move-object/from16 v22, v11

    const/16 v16, 0x0

    move/from16 v6, p5

    move/from16 v7, p6

    :goto_2e
    move-object/from16 v3, v22

    goto :goto_2f

    :catchall_2f
    move-exception v0

    move v10, v4

    move v12, v5

    const/16 v16, 0x0

    move-object/from16 v3, p2

    move/from16 v6, p5

    move/from16 v7, p6

    .line 272
    :goto_2f
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    if-eqz v3, :cond_2c

    .line 273
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge v10, v0, :cond_2c

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge v12, v0, :cond_2c

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v8, p7

    move v4, v10

    move v5, v12

    .line 274
    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->vDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    goto :goto_30

    :cond_2c
    move v4, v10

    move v5, v12

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "############ ERROR DRAW TEXT:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " ############"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x1

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v16

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_2d
    :goto_30
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 98
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 100
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v0, :cond_8

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_4

    .line 103
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    if-nez v0, :cond_8

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_4

    :cond_2
    const/4 v0, -0x1

    .line 106
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->forceBoldLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->firstDrawLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine:I

    .line 107
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MRTextView;->initCurrentViewObjs()V

    .line 108
    invoke-static {}, Lcom/flyersoft/tools/A;->isHtmlContent()Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    sput-boolean v1, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    .line 109
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v1

    const/4 v3, 0x7

    const/4 v4, 0x0

    if-ne v1, v3, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    .line 110
    :goto_0
    sput-boolean v3, Lcom/flyersoft/staticlayout/MRTextView;->isPdf:Z

    if-nez v1, :cond_4

    const/4 v1, 0x1

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    .line 111
    :goto_1
    sput-boolean v1, Lcom/flyersoft/staticlayout/MRTextView;->isTxtFile:Z

    .line 112
    sget-boolean v1, Lcom/flyersoft/tools/A;->textJustified:Z

    if-nez v1, :cond_6

    sget-boolean v1, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    goto :goto_3

    :cond_6
    :goto_2
    const/4 v1, 0x1

    :goto_3
    iput-boolean v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->selfJustified:Z

    .line 114
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    instance-of v1, v1, Landroid/text/Spanned;

    if-eqz v1, :cond_7

    .line 115
    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLastBorderTopLine(I)I

    move-result v1

    iput v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastBorderTopLine:I

    .line 116
    iput-boolean v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->drawMarginBackgroundOnly:Z

    .line 117
    invoke-super {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 119
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->drawAllHighlight(Landroid/graphics/Canvas;)V

    .line 120
    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->txtSplitLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->forceBoldLine:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->firstDrawLine:I

    .line 121
    iput-boolean v4, p0, Lcom/flyersoft/staticlayout/MRTextView;->drawMarginBackgroundOnly:Z

    .line 122
    invoke-super {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 123
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->drawMRSpanLines(Landroid/graphics/Canvas;)V

    :cond_8
    :goto_4
    return-void
.end method

.method public removeLineSpans(I)V
    .locals 2

    .line 2241
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2243
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2244
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineSpans:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-void
.end method

.method public restoreAppendedBottom()V
    .locals 3

    .line 2735
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->appendLineCount:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getBottom()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    if-ge v0, v1, :cond_1

    .line 2737
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 2738
    iget v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setBottom(I)V

    .line 2739
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_1

    .line 2740
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setBottom(I)V

    return-void

    .line 2742
    :cond_0
    const-class v0, Landroid/view/View;

    const-string v1, "mBottom"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    .line 2743
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 2744
    iget v1, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2745
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v1, :cond_1

    .line 2746
    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget v2, p0, Lcom/flyersoft/staticlayout/MRTextView;->mBottom2:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 2749
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public selfDrawLine(I)Z
    .locals 7

    .line 2210
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lineBrokens:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2212
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->selfJustified:Z

    .line 2214
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineVisibleEnd(I)I

    move-result v2

    .line 2215
    sget-boolean v3, Lcom/flyersoft/staticlayout/MRTextView;->isTxtContent:Z

    if-nez v3, :cond_5

    .line 2216
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v3

    const/4 v4, 0x3

    const/4 v5, 0x1

    if-eq v3, v4, :cond_4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    .line 2220
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-direct {p0, v0, p1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphEnd(Ljava/lang/CharSequence;II)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 2221
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineSpans(I)[Ljava/lang/Object;

    move-result-object v4

    .line 2222
    const-class v6, Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-static {v4, v6}, Lcom/flyersoft/tools/T;->spansHasKind([Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v0, :cond_3

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    return v5

    :cond_5
    const/4 v3, 0x0

    :goto_1
    if-eqz v0, :cond_7

    .line 2225
    iget-boolean v4, p0, Lcom/flyersoft/staticlayout/MRTextView;->selfJustified:Z

    if-eqz v4, :cond_7

    if-nez v3, :cond_6

    .line 2227
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-direct {p0, v3, p1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isParagraphEnd(Ljava/lang/CharSequence;II)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 2228
    :cond_6
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7

    return v1

    :cond_7
    return v0
.end method

.method public setForceHeight(I)V
    .locals 2

    .line 2755
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getTop()I

    move-result v0

    add-int/2addr v0, p1

    .line 2756
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt p1, v1, :cond_0

    .line 2757
    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setBottom(I)V

    return-void

    .line 2759
    :cond_0
    const-class p1, Landroid/view/View;

    const-string v1, "mBottom"

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v1, 0x1

    .line 2760
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 2761
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2764
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public setLineSpacing(FF)V
    .locals 0

    .line 2608
    invoke-super {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyTextView;->setLineSpacing(FF)V

    .line 2609
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1

    const/4 v0, 0x0

    .line 2570
    iput-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->pureText:Ljava/lang/String;

    .line 2571
    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastChapter:I

    .line 2572
    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    iput v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->lastSplitIndex:I

    .line 2573
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    const/4 v0, 0x0

    .line 2574
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->rubyInited:Z

    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasEmphasis:Z

    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MRTextView;->hasRuby:Z

    .line 2575
    invoke-super {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTextSize(F)V
    .locals 0

    .line 2596
    invoke-super {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setTextSize(F)V

    .line 2597
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 2602
    invoke-super {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 2603
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    return-void
.end method

.class public final Lcom/example2014/numberpicker/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example2014/numberpicker/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static NumberPicker:[I = null

.field public static NumberPicker_internalLayout:I = 0x0

.field public static NumberPicker_internalMaxHeight:I = 0x1

.field public static NumberPicker_internalMaxWidth:I = 0x2

.field public static NumberPicker_internalMinHeight:I = 0x3

.field public static NumberPicker_internalMinWidth:I = 0x4

.field public static NumberPicker_selectionDivider:I = 0x5

.field public static NumberPicker_selectionDividerHeight:I = 0x6

.field public static NumberPicker_selectionDividersDistance:I = 0x7

.field public static NumberPicker_solidColor:I = 0x8

.field public static NumberPicker_virtualButtonPressedDrawable:I = 0x9


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/example2014/numberpicker/R$styleable;->NumberPicker:[I

    return-void

    :array_0
    .array-data 4
        0x7f040245
        0x7f040246
        0x7f040247
        0x7f040248
        0x7f040249
        0x7f0403d4
        0x7f0403d5
        0x7f0403d6
        0x7f0403fe
        0x7f04050b
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

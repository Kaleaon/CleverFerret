.class Lcom/facebook/soloader/Elf64$Shdr;
.super Ljava/lang/Object;
.source "Elf64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/soloader/Elf64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Shdr"
.end annotation


# static fields
.field public static final SH_ADDR:I = 0x10

.field public static final SH_ADDRALIGN:I = 0x30

.field public static final SH_ENTSIZE:I = 0x38

.field public static final SH_FLAGS:I = 0x8

.field public static final SH_INFO:I = 0x2c

.field public static final SH_LINK:I = 0x28

.field public static final SH_NAME:I = 0x0

.field public static final SH_OFFSET:I = 0x18

.field public static final SH_SIZE:I = 0x20

.field public static final SH_TYPE:I = 0x4


# direct methods
.method constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

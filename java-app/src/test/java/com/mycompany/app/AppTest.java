package com.mycompany.app;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit test for simple App.
 */
public class AppTest
{

    @Test
    public void testAppConstructor() {
        try {
            new App();
        } catch (Exception e) {
            fail("Construction failed.");
        }
    }

    @Test
    public void testAppMain()
    {
        try {
            assertEquals("Hello from Pipeline!", new App().getMessage());
        } catch (AssertionError e) {
            fail("\"message\" is not \"Hello from Pipeline!\"");
        }
    }

}
